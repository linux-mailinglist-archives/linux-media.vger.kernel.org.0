Return-Path: <linux-media+bounces-65409-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZD/KI1mfOWrSvgcAu9opvQ
	(envelope-from <linux-media+bounces-65409-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 22:47:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F76B2587
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 22:47:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=MVhdyBWa;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65409-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65409-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8102E3073843
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40415364943;
	Mon, 22 Jun 2026 20:44:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f74.google.com (mail-yx1-f74.google.com [74.125.224.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC71364929
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 20:44:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161051; cv=none; b=HVqB1WZfQOufpgWLbMtAF9qo1mIc//h27ATxEwDMr83tuvitO1Lw4G78+r34jk4YOppVRzSwzM/jVCMmiW/s8XOFA89WpfbDDS/kfx4TTln0TaFpT1BZsUuG6Epr/qrn97kUbfPP2TZg9vgRZ3JSZsizpLpacUsnl+uEGQXxH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161051; c=relaxed/simple;
	bh=l+ALPaOR6UdtK3KLYhtDoyOxvqKzcIAHC1ZWqGr/jvs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ROJ7+ymIPzrTxVPMxvi+Ng6RVUvNSEctWvl0MZ4Jntem0CEydVY3efyKvkC3CW8la6nzKSsEIZWam1/ah8jtPpoHc29hzzhgq/WOjc3XuuFvk/iH4KQu3MY01kvFAQaLlW1kfet1eqcrK1tVtNcyZKiGDh05qAU9zFgqce/aZIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MVhdyBWa; arc=none smtp.client-ip=74.125.224.74
Received: by mail-yx1-f74.google.com with SMTP id 956f58d0204a3-663116204d4so4430997d50.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 13:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782161046; x=1782765846; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qbd+ErVpTMqoj4rYbI9Me/PtOr3sKeSxArUxIQCaRmY=;
        b=MVhdyBWa8f1adTlvMkEST/DiKuob5sn4NoF0EV58kMhN1Ob4ocq1PaRiRYF7CsngLU
         EUzUbRXq/M0eiwo2sDYmrayNt6xQPryZrXmm85beEqyuXpfsdMkj6EVH3T/CD2YxeLu/
         U2V26Xk5RG6HA2CRec0tzQculB1/Xg3H3zWvnjS9tN5wwgcfOXvBebEhaTHStjyt6Rtm
         VFBvNgBztmhh6pkIhvid09YM2NIeWjNysjlBIG18Fc3lmJ9rOuawWUy2Ewz//1HWepWc
         urOBnJzY4NI/wWH1bov8CNMbPPGBqeCQknLN8mSsDjdtENAhiQFoNSEZkMIH4C7M4Imf
         RXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782161046; x=1782765846;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qbd+ErVpTMqoj4rYbI9Me/PtOr3sKeSxArUxIQCaRmY=;
        b=C7Qv8tlk1QLIpG+Ff64uot+5nbECPLGYyPC41t1N6t/+0T+yL6Bf4dXmevjnm+MrQO
         MNAj7nJ7WcxfS9v6gP0v3qT6r5Wi53QIkIOKbHnupd8hf3QKw1nPq/lZW0bUWIsv9Quf
         ftay/u3NZjTB1QPfmKVfkbGuMp45b+RUR6h5d+UEH9iX8cM811iIADefEu/mOCbcTwbS
         bOEjtPI2IPb7/WkgCP67W7Nrcwx3CeYwh/PzIMkvwFT0P8Nz8aZMw2lgu62bUnw93F7p
         weTGnOKzDImsGKyafUQLaOI3SpLSuM6F2+zzR6HJNAo9PVw2A9i074jU77R1b0NbzpxC
         kKfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQA95F2UaLUB0uhtlF3Q6DDXo/ezpQtd/0OZbh7FiZNfK6WEYQLYN223jgIjC7DI0jItcbWP42IKIjUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqIdSbMfnm2wASdVApf1uI1oY5khc7sKvK8rpT+KkSkKK6IO7+
	ZQ9kqf7lVDLaN6HZvpBSZ1Lj+Hdc/QIpThFqGgXkckLKAbAg2VI9kP3SUVd8fSA6MY1KbwpDIho
	aHvTF5RYaQ6cHux+htacz3J7iA83r
X-Received: from yxup11.prod.google.com ([2002:a53:ee8b:0:b0:660:3244:8954])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:690e:240c:b0:660:a41d:d175 with SMTP id 956f58d0204a3-662fcba05femr12448726d50.55.1782161046025;
 Mon, 22 Jun 2026 13:44:06 -0700 (PDT)
Date: Mon, 22 Jun 2026 16:43:39 -0400
In-Reply-To: <20260622204343.1994418-1-briandaniels@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260622204343.1994418-1-briandaniels@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260622204343.1994418-5-briandaniels@google.com>
Subject: [PATCH v4 4/8] media: virtio: Add scatterlist_builder
From: Brian Daniels <briandaniels@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: acourbot@google.com, adelva@google.com, aesteve@redhat.com, 
	changyeon@google.com, daniel.almeida@collabora.com, eperezma@redhat.com, 
	gnurou@gmail.com, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	Brian Daniels <briandaniels@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mst@redhat.com,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,m:briandaniels@google.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65409-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D94F76B2587

From: Alexandre Courbot <gnurou@gmail.com>

The guest data can very often be transferred to the device without any
copies and with minimal modification. The scatterlist_builder contains
the logic to construct the scatter lists passed to the virtqueues with
minimal copying.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
Co-developed-by: Brian Daniels <briandaniels@google.com>
Signed-off-by: Brian Daniels <briandaniels@google.com>
---
 drivers/media/virtio/scatterlist_builder.c | 574 +++++++++++++++++++++
 drivers/media/virtio/scatterlist_builder.h | 112 ++++
 2 files changed, 686 insertions(+)
 create mode 100644 drivers/media/virtio/scatterlist_builder.c
 create mode 100644 drivers/media/virtio/scatterlist_builder.h

diff --git a/drivers/media/virtio/scatterlist_builder.c b/drivers/media/virtio/scatterlist_builder.c
new file mode 100644
index 000000000..619c59f31
--- /dev/null
+++ b/drivers/media/virtio/scatterlist_builder.c
@@ -0,0 +1,574 @@
+// SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+
+
+/*
+ * Scatterlist builder helpers for virtio-media.
+ *
+ * Copyright (c) 2024-2025 Google LLC.
+ */
+
+#include <linux/moduleparam.h>
+#include <linux/scatterlist.h>
+#include <linux/videodev2.h>
+#include <media/videobuf2-memops.h>
+
+#include "protocol.h"
+#include "scatterlist_builder.h"
+#include "session.h"
+
+/*
+ * If set to ``true``, then the driver will always copy the data passed to the
+ * host into the shadow buffer (instead of trying to map the source memory into
+ * the SG table directly when possible).
+ */
+static bool always_use_shadow_buffer;
+module_param(always_use_shadow_buffer, bool, 0660);
+
+/* Convert a V4L2 IOCTL into the IOCTL code we can give to the host */
+#define VIRTIO_MEDIA_IOCTL_CODE(IOCTL) (((IOCTL) >> _IOC_NRSHIFT) & _IOC_NRMASK)
+
+/**
+ * scatterlist_builder_add_descriptor() - Add a descriptor to the chain.
+ * @builder: builder to use.
+ * @desc_index: index of the descriptor to add.
+ *
+ * Returns ``-ENOSPC`` if ``sgs`` is already full.
+ */
+int scatterlist_builder_add_descriptor(struct scatterlist_builder *builder,
+				       size_t desc_index)
+{
+	if (builder->cur_sg >= builder->num_sgs)
+		return -ENOSPC;
+	builder->sgs[builder->cur_sg++] = &builder->descs[desc_index];
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_add_data() - Append arbitrary data to the descriptor
+ *                                  chain.
+ * @builder: builder to use.
+ * @data: pointer to the data to add to the descriptor chain.
+ * @len: length of the data to add.
+ *
+ * @data will either be directly referenced, or copied into the shadow buffer
+ * to be referenced from there.
+ */
+int scatterlist_builder_add_data(struct scatterlist_builder *builder,
+				 void *data, size_t len)
+{
+	const size_t cur_desc = builder->cur_desc;
+
+	if (len == 0)
+		return 0;
+
+	if (builder->cur_desc >= builder->num_descs)
+		return -ENOSPC;
+
+	if (!always_use_shadow_buffer && virt_addr_valid(data + len)) {
+		/*
+		 * If "data" is in the 1:1 physical memory mapping then we can
+		 * use a single SG entry and avoid copying.
+		 */
+		struct page *page = virt_to_page(data);
+		size_t offset = (((size_t)data) & ~PAGE_MASK);
+		struct scatterlist *next_desc =
+			&builder->descs[builder->cur_desc];
+
+		memset(next_desc, 0, sizeof(*next_desc));
+		sg_set_page(next_desc, page, len, offset);
+		builder->cur_desc++;
+	} else if (!always_use_shadow_buffer && is_vmalloc_addr(data)) {
+		int prev_pfn = -2;
+
+		/*
+		 * If "data" has been vmalloc'ed, we need at most one entry per
+		 * memory page but can avoid copying.
+		 */
+		while (len > 0) {
+			struct page *page = vmalloc_to_page(data);
+			int cur_pfn = page_to_pfn(page);
+			/* All pages but the first will start at offset 0. */
+			unsigned long offset =
+				(((unsigned long)data) & ~PAGE_MASK);
+			size_t len_in_page = min(PAGE_SIZE - offset, len);
+			struct scatterlist *next_desc =
+				&builder->descs[builder->cur_desc];
+
+			if (builder->cur_desc >= builder->num_descs)
+				return -ENOSPC;
+
+			/* Optimize contiguous pages */
+			if (cur_pfn == prev_pfn + 1) {
+				(next_desc - 1)->length += len_in_page;
+			} else {
+				memset(next_desc, 0, sizeof(*next_desc));
+				sg_set_page(next_desc, page, len_in_page,
+					    offset);
+				builder->cur_desc++;
+			}
+			data += len_in_page;
+			len -= len_in_page;
+			prev_pfn = cur_pfn;
+		}
+	} else {
+		/*
+		 * As a last resort, copy into the shadow buffer and reference
+		 * it with a single SG entry. Calling
+		 * `scatterlist_builder_retrieve_data` will be necessary to copy
+		 * the data written by the device back into @data.
+		 */
+		void *shadow_buffer =
+			builder->shadow_buffer + builder->shadow_buffer_pos;
+		struct page *page = virt_to_page(shadow_buffer);
+		unsigned long offset =
+			(((unsigned long)shadow_buffer) & ~PAGE_MASK);
+		struct scatterlist *next_desc =
+			&builder->descs[builder->cur_desc];
+
+		if (len >
+		    builder->shadow_buffer_size - builder->shadow_buffer_pos)
+			return -ENOSPC;
+
+		memcpy(shadow_buffer, data, len);
+		memset(next_desc, 0, sizeof(*next_desc));
+		sg_set_page(next_desc, page, len, offset);
+		builder->cur_desc++;
+		builder->shadow_buffer_pos += len;
+	}
+
+	sg_mark_end(&builder->descs[builder->cur_desc - 1]);
+	return scatterlist_builder_add_descriptor(builder, cur_desc);
+}
+
+/**
+ * scatterlist_builder_retrieve_data() - Retrieve a response written by the
+ * device on the shadow buffer.
+ * @builder: builder to use.
+ * @sg_index: index of the descriptor to read from.
+ * @data: destination for the shadowed data.
+ *
+ * If the shadow buffer is pointed to by the descriptor at index @sg_index of
+ * the chain, then ``sg->length`` bytes are copied back from it into @data.
+ * Otherwise nothing is done since the device has written into @data directly.
+ *
+ * @data must have originally been added by ``scatterlist_builder_add_data`` as
+ * the same size as passed to ``scatterlist_builder_add_data`` will be copied
+ * back.
+ */
+int scatterlist_builder_retrieve_data(struct scatterlist_builder *builder,
+				      size_t sg_index, void *data)
+{
+	void *shadow_buf = builder->shadow_buffer;
+	struct scatterlist *sg;
+	void *kaddr;
+
+	/* We can only retrieve from the range of sgs currently set. */
+	if (sg_index >= builder->cur_sg)
+		return -ERANGE;
+
+	sg = builder->sgs[sg_index];
+	kaddr = pfn_to_kaddr(page_to_pfn(sg_page(sg))) + sg->offset;
+
+	if (kaddr >= shadow_buf &&
+	    kaddr < shadow_buf + VIRTIO_SHADOW_BUF_SIZE) {
+		if (kaddr + sg->length >= shadow_buf + VIRTIO_SHADOW_BUF_SIZE)
+			return -EINVAL;
+
+		memcpy(data, kaddr, sg->length);
+	}
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_add_ioctl_cmd() - Add an ioctl command to the descriptor
+ * chain.
+ * @builder: builder to use.
+ * @session: session on behalf of which the ioctl command is added.
+ * @ioctl_code: code of the ioctl to add (i.e. ``VIDIOC_*``).
+ */
+int scatterlist_builder_add_ioctl_cmd(struct scatterlist_builder *builder,
+				      struct virtio_media_session *session,
+				      u32 ioctl_code)
+{
+	struct virtio_media_cmd_ioctl *cmd_ioctl = &session->cmd.ioctl;
+
+	cmd_ioctl->hdr.cmd = VIRTIO_MEDIA_CMD_IOCTL;
+	cmd_ioctl->session_id = session->id;
+	cmd_ioctl->code = VIRTIO_MEDIA_IOCTL_CODE(ioctl_code);
+
+	return scatterlist_builder_add_data(builder, cmd_ioctl,
+					    sizeof(*cmd_ioctl));
+}
+
+/**
+ * scatterlist_builder_add_ioctl_resp() - Add storage to receive an ioctl
+ * response to the descriptor chain.
+ * @builder: builder to use.
+ * @session: session on behalf of which the ioctl response is added.
+ */
+int scatterlist_builder_add_ioctl_resp(struct scatterlist_builder *builder,
+				       struct virtio_media_session *session)
+{
+	struct virtio_media_resp_ioctl *resp_ioctl = &session->resp.ioctl;
+
+	return scatterlist_builder_add_data(builder, resp_ioctl,
+					    sizeof(*resp_ioctl));
+}
+
+/**
+ * __scatterlist_builder_add_userptr() - Add user pages to @builder.
+ * @builder: builder to use.
+ * @userptr: pointer to userspace memory that we want to add.
+ * @length: length of the data to add.
+ * @sg_list: output parameter. Upon success, points to the area of the shadow
+ * buffer containing the array of SG entries to be added to the descriptor
+ * chain.
+ * @nents: output parameter. Upon success, contains the number of entries
+ * pointed to by @sg_list.
+ *
+ * Data referenced by userspace pointers can be potentially large and very
+ * scattered, which could overwhelm the descriptor chain if added as-is. For
+ * these, we instead build an array of ``struct virtio_media_sg_entry`` in the
+ * shadow buffer and reference it using a single descriptor.
+ *
+ * This function is a helper to perform that. Callers should then add the
+ * descriptor to the chain properly.
+ *
+ * Returns -EFAULT if @userptr is not a valid user address, which is a case the
+ * driver should consider as "normal" operation. All other failures signal a
+ * problem with the driver.
+ */
+static int
+__scatterlist_builder_add_userptr(struct scatterlist_builder *builder,
+				  unsigned long userptr, unsigned long length,
+				  struct virtio_media_sg_entry **sg_list,
+				  int *nents)
+{
+	struct sg_table sg_table = {};
+	struct frame_vector *framevec;
+	struct scatterlist *sg_iter;
+	struct page **pages;
+	const unsigned int offset = userptr & ~PAGE_MASK;
+	unsigned int pages_count;
+	size_t entries_size;
+	int i;
+	int ret;
+
+	framevec = vb2_create_framevec(userptr, length, true);
+	if (IS_ERR(framevec)) {
+		if (PTR_ERR(framevec) != -EFAULT) {
+			pr_warn("error %ld creating frame vector for userptr 0x%lx, length 0x%lx\n",
+				PTR_ERR(framevec), userptr, length);
+		} else {
+			/* -EINVAL is expected in case of invalid userptr. */
+			framevec = ERR_PTR(-EINVAL);
+		}
+		return PTR_ERR(framevec);
+	}
+
+	pages = frame_vector_pages(framevec);
+	if (IS_ERR(pages)) {
+		pr_warn("error getting vector pages\n");
+		ret = PTR_ERR(pages);
+		goto done;
+	}
+	pages_count = frame_vector_count(framevec);
+	ret = sg_alloc_table_from_pages(&sg_table, pages, pages_count, offset,
+					length, 0);
+	if (ret) {
+		pr_warn("error creating sg table\n");
+		goto done;
+	}
+
+	/* Allocate our actual SG in the shadow buffer. */
+	*nents = sg_nents(sg_table.sgl);
+	entries_size = sizeof(**sg_list) * *nents;
+	if (builder->shadow_buffer_pos + entries_size >
+	    builder->shadow_buffer_size) {
+		ret = -ENOMEM;
+		goto free_sg;
+	}
+
+	*sg_list = builder->shadow_buffer + builder->shadow_buffer_pos;
+	builder->shadow_buffer_pos += entries_size;
+
+	for_each_sgtable_sg(&sg_table, sg_iter, i) {
+		struct virtio_media_sg_entry *sg_entry = &(*sg_list)[i];
+
+		sg_entry->start = sg_phys(sg_iter);
+		sg_entry->len = sg_iter->length;
+	}
+
+free_sg:
+	sg_free_table(&sg_table);
+
+done:
+	vb2_destroy_framevec(framevec);
+	return ret;
+}
+
+/**
+ * scatterlist_builder_add_userptr() - Add a user-memory buffer using an array
+ * of ``struct virtio_media_sg_entry``.
+ * @builder: builder to use.
+ * @userptr: pointer to userspace memory that we want to add.
+ * @length: length of the data to add.
+ *
+ * Upon success, an array of ``struct virtio_media_sg_entry`` referencing
+ * @userptr has been built into the shadow buffer, and that array added to the
+ * descriptor chain.
+ */
+static int scatterlist_builder_add_userptr(struct scatterlist_builder *builder,
+					   unsigned long userptr,
+					   unsigned long length)
+{
+	int ret;
+	int nents;
+	struct virtio_media_sg_entry *sg_list;
+
+	ret = __scatterlist_builder_add_userptr(builder, userptr, length,
+						&sg_list, &nents);
+	if (ret)
+		return ret;
+
+	ret = scatterlist_builder_add_data(builder, sg_list,
+					   sizeof(*sg_list) * nents);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_add_buffer() - Add a ``v4l2_buffer`` and its planes to
+ * the descriptor chain.
+ * @builder: builder to use.
+ * @b: ``v4l2_buffer`` to add.
+ */
+int scatterlist_builder_add_buffer(struct scatterlist_builder *builder,
+				   struct v4l2_buffer *b)
+{
+	int i;
+	int ret;
+
+	/* Fixup: plane length must be zero if userptr is NULL */
+	if (!V4L2_TYPE_IS_MULTIPLANAR(b->type) &&
+	    b->memory == V4L2_MEMORY_USERPTR && b->m.userptr == 0)
+		b->length = 0;
+
+	/* v4l2_buffer */
+	ret = scatterlist_builder_add_data(builder, b, sizeof(*b));
+	if (ret)
+		return ret;
+
+	if (V4L2_TYPE_IS_MULTIPLANAR(b->type) && b->length > 0) {
+		/* Fixup: plane length must be zero if userptr is NULL */
+		if (b->memory == V4L2_MEMORY_USERPTR) {
+			for (i = 0; i < b->length; i++) {
+				struct v4l2_plane *plane = &b->m.planes[i];
+
+				if (plane->m.userptr == 0)
+					plane->length = 0;
+			}
+		}
+
+		/* Array of v4l2_planes */
+		ret = scatterlist_builder_add_data(builder, b->m.planes,
+						   sizeof(struct v4l2_plane) *
+							   b->length);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_add_buffer_userptr() - Add the payload of a ``USERTPR``
+ * v4l2_buffer to the descriptor chain.
+ * @builder: builder to use.
+ * @b: ``v4l2_buffer`` which ``USERPTR`` payload we want to add.
+ *
+ * Add an array of ``virtio_media_sg_entry`` pointing to a ``USERPTR`` buffer's
+ * contents. Does nothing if the buffer is not of type ``USERPTR``. This is
+ * split out of :ref:`scatterlist_builder_add_buffer` because we only want to
+ * add these to the device-readable part of the descriptor chain.
+ */
+int scatterlist_builder_add_buffer_userptr(struct scatterlist_builder *builder,
+					   struct v4l2_buffer *b)
+{
+	int i;
+	int ret;
+
+	if (b->memory != V4L2_MEMORY_USERPTR)
+		return 0;
+
+	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
+		for (i = 0; i < b->length; i++) {
+			struct v4l2_plane *plane = &b->m.planes[i];
+
+			if (b->memory == V4L2_MEMORY_USERPTR &&
+			    plane->length > 0) {
+				unsigned long uptr = plane->m.userptr;
+				unsigned long len = plane->length;
+
+				ret =
+				scatterlist_builder_add_userptr(builder,
+								uptr,
+								len);
+				if (ret)
+					return ret;
+			}
+		}
+	} else if (b->length > 0) {
+		ret = scatterlist_builder_add_userptr(builder, b->m.userptr,
+						      b->length);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_retrieve_buffer() - Retrieve a v4l2_buffer written by
+ * the device on the shadow buffer, if needed.
+ * @builder: builder to use.
+ * @sg_index: index of the first SG entry of the buffer in the builder's
+ * descriptor chain.
+ * @b: v4l2_buffer to copy shadow buffer data into.
+ * @orig_planes: the original ``planes`` pointer, to be restored if the buffer
+ * is multi-planar.
+ *
+ * If the v4l2_buffer pointed by @buffer_sgs was copied into the shadow buffer,
+ * then its updated content is copied back into @b. Otherwise nothing is done
+ * as the device has written into @b directly.
+ *
+ * @orig_planes is used to restore the original ``planes`` pointer in case it
+ * gets modified by the host. The specification stipulates that the host should
+ * not modify it, but we enforce this for additional safety.
+ */
+int scatterlist_builder_retrieve_buffer(struct scatterlist_builder *builder,
+					size_t sg_index, struct v4l2_buffer *b,
+					struct v4l2_plane *orig_planes)
+{
+	int ret;
+
+	ret = scatterlist_builder_retrieve_data(builder, sg_index++, b);
+	if (ret)
+		return ret;
+
+	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
+		b->m.planes = orig_planes;
+
+		if (orig_planes) {
+			ret = scatterlist_builder_retrieve_data(builder,
+								sg_index++,
+								b->m.planes);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_add_ext_ctrls() - Add a v4l2_ext_controls and its
+ * controls to @builder.
+ * @builder: builder to use.
+ * @ctrls: ``struct v4l2_ext_controls`` to add.
+ *
+ * Add @ctrls and its array of `struct v4l2_ext_control` to the descriptor
+ * chain.
+ */
+int scatterlist_builder_add_ext_ctrls(struct scatterlist_builder *builder,
+				      struct v4l2_ext_controls *ctrls)
+{
+	int ret;
+
+	/* v4l2_ext_controls */
+	ret = scatterlist_builder_add_data(builder, ctrls, sizeof(*ctrls));
+	if (ret)
+		return ret;
+
+	if (ctrls->count > 0) {
+		/* array of v4l2_controls */
+		ret = scatterlist_builder_add_data(builder, ctrls->controls,
+						   sizeof(ctrls->controls[0]) *
+							   ctrls->count);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_add_ext_ctrls_userptrs() - Add the userspace payloads of
+ * a ``struct v4l2_ext_controls`` to the descriptor chain.
+ * @builder: builder to use.
+ * @ctrls: ``struct v4l2_ext_controls`` from which we want to add the
+ *         userspace payload of.
+ *
+ * Add the userspace payloads of @ctrls to the descriptor chain. This is split
+ * out of :ref:`scatterlist_builder_add_ext_ctrls` because we only want to add
+ * these to the device-readable part of the descriptor chain.
+ */
+int
+scatterlist_builder_add_ext_ctrls_userptrs(struct scatterlist_builder *builder,
+					   struct v4l2_ext_controls *ctrls)
+{
+	int i;
+	int ret;
+
+	/* Pointers to user memory in individual controls */
+	for (i = 0; i < ctrls->count; i++) {
+		struct v4l2_ext_control *ctrl = &ctrls->controls[i];
+
+		if (ctrl->size > 0) {
+			unsigned long uptr = (unsigned long)ctrl->ptr;
+
+			ret = scatterlist_builder_add_userptr(builder, uptr,
+							      ctrl->size);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * scatterlist_builder_retrieve_ext_ctrls() - Retrieve controls written by the
+ * device on the shadow buffer, if needed.
+ * @builder: builder to use.
+ * @sg_index: index of the first SG entry of the controls in the builder's
+ * descriptor chain.
+ * @ctrls: ``struct v4l2_ext_controls`` to copy shadow buffer data into.
+ *
+ * If the shadow buffer is pointed to by @sg, copy its content back into @ctrls.
+ */
+int scatterlist_builder_retrieve_ext_ctrls(struct scatterlist_builder *builder,
+					   size_t sg_index,
+					   struct v4l2_ext_controls *ctrls)
+{
+	struct v4l2_ext_control *controls_backup = ctrls->controls;
+	int ret;
+
+	ret = scatterlist_builder_retrieve_data(builder, sg_index++, ctrls);
+	if (ret)
+		return ret;
+
+	ctrls->controls = controls_backup;
+
+	if (ctrls->count > 0 && ctrls->controls) {
+		ret = scatterlist_builder_retrieve_data(builder, sg_index++,
+							ctrls->controls);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/virtio/scatterlist_builder.h b/drivers/media/virtio/scatterlist_builder.h
new file mode 100644
index 000000000..505ba1f45
--- /dev/null
+++ b/drivers/media/virtio/scatterlist_builder.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
+
+/*
+ * Scatterlist builder helpers for virtio-media.
+ *
+ * Copyright (c) 2024-2025 Google LLC.
+ */
+
+#ifndef __VIRTIO_MEDIA_SCATTERLIST_BUILDER_H
+#define __VIRTIO_MEDIA_SCATTERLIST_BUILDER_H
+
+#include <linux/scatterlist.h>
+
+#include "session.h"
+
+/**
+ * struct scatterlist_builder - helper to build a scatterlist from data.
+ * @descs: pool of descriptors to use.
+ * @num_descs: number of entries in descs.
+ * @cur_desc: next descriptor to be used in @descs.
+ * @shadow_buffer: pointer to a shadow buffer where elements that cannot be
+ * mapped directly into the scatterlist get copied.
+ * @shadow_buffer_size: size of @shadow_buffer.
+ * @shadow_buffer_pos: current position in @shadow_buffer.
+ * @sgs: descriptor chain to eventually pass to virtio functions.
+ * @num_sgs: total number of entries in @sgs.
+ * @cur_sg: next entry in @sgs to be used.
+ *
+ * Virtio passes data from the driver to the device (through e.g.
+ * ``virtqueue_add_sgs``) via a scatterlist that the device interprets as a
+ * linear view over scattered driver memory.
+ *
+ * In virtio-media, the payload of ioctls from user-space can for the most part
+ * be passed as-is, or after slight modification, which makes it tempting to
+ * just forward the ioctl payload received from user-space as-is instead of
+ * doing another copy into a dedicated buffer. This structure helps with this.
+ *
+ * virtio-media descriptor chains are typically made of the following parts:
+ *
+ * Device-readable:
+ * - A command structure, i.e. ``virtio_media_cmd_*``,
+ * - An ioctl payload (one of the regular ioctl parameters),
+ * - (optionally) arrays of ``virtio_media_sg_entry`` describing the content of
+ *   buffers in guest memory.
+ *
+ * Device-writable:
+ * - A response structure, i.e. ``virtio_media_resp_*``,
+ * - An ioctl payload, that the device will write to.
+ *
+ * This structure helps laying out the descriptor chain into its @sgs member in
+ * an optimal way, by building a scatterlist adapted to the originating memory
+ * of the data we want to pass to the device while avoiding copies when
+ * possible.
+ *
+ * It is made of a pool of ``struct scatterlist`` (@descs) that is used to
+ * build the final descriptor chain @sgs, and a @shadow_buffer where data that
+ * cannot (or should not) be mapped directly by the host can be temporarily
+ * copied.
+ */
+struct scatterlist_builder {
+	struct scatterlist *descs;
+	size_t num_descs;
+	size_t cur_desc;
+
+	void *shadow_buffer;
+	size_t shadow_buffer_size;
+	size_t shadow_buffer_pos;
+
+	struct scatterlist **sgs;
+	size_t num_sgs;
+	size_t cur_sg;
+};
+
+int scatterlist_builder_add_descriptor(struct scatterlist_builder *builder,
+				       size_t desc_index);
+
+int scatterlist_builder_add_data(struct scatterlist_builder *builder,
+				 void *data, size_t len);
+
+int scatterlist_builder_retrieve_data(struct scatterlist_builder *builder,
+				      size_t sg_index, void *data);
+
+int scatterlist_builder_add_ioctl_cmd(struct scatterlist_builder *builder,
+				      struct virtio_media_session *session,
+				      u32 ioctl_code);
+
+int scatterlist_builder_add_ioctl_resp(struct scatterlist_builder *builder,
+				       struct virtio_media_session *session);
+
+int scatterlist_builder_add_buffer(struct scatterlist_builder *builder,
+				   struct v4l2_buffer *buffer);
+
+int scatterlist_builder_add_buffer_userptr(struct scatterlist_builder *builder,
+					   struct v4l2_buffer *b);
+
+int scatterlist_builder_retrieve_buffer(struct scatterlist_builder *builder,
+					size_t sg_index,
+					struct v4l2_buffer *buffer,
+					struct v4l2_plane *orig_planes);
+
+int scatterlist_builder_add_ext_ctrls(struct scatterlist_builder *builder,
+				      struct v4l2_ext_controls *ctrls);
+
+int
+scatterlist_builder_add_ext_ctrls_userptrs(struct scatterlist_builder *builder,
+					   struct v4l2_ext_controls *ctrls);
+
+int scatterlist_builder_retrieve_ext_ctrls(struct scatterlist_builder *builder,
+					   size_t sg_index,
+					   struct v4l2_ext_controls *ctrls);
+
+#endif // __VIRTIO_MEDIA_SCATTERLIST_BUILDER_H
-- 
2.55.0.rc0.799.gd6f94ed593-goog


