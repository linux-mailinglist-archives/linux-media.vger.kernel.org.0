Return-Path: <linux-media+bounces-65667-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1hfMGpCOPWpB4AgAu9opvQ
	(envelope-from <linux-media+bounces-65667-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 22:24:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC316C87E7
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 22:24:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=Nui8K5nf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65667-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65667-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB406306B797
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 20:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E175B33A03A;
	Thu, 25 Jun 2026 20:24:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FC92BEC34
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 20:24:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782419072; cv=none; b=L7teZGZjwWbacwEvUgDNV1IkPQ6mmbHJH6oBrU3x1TufYhcCAZ4xiidrxnPOYmaAdMoT5Vl3JxqwK+I3+mOUbxs8qnqBUoHE9FFfpzCyNRfT19tFsZfp6SWs3sYmQPytDel68qvyqW7/c67LYnekJz3++C09udORafx3Nnybd+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782419072; c=relaxed/simple;
	bh=5Gu1djFx39qL2WPBl6XhzgHlaItkNMyPxsKAOu99RMA=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=BiuZ4k0SPds8TvluZ4dsJfRIMjYscj97CsrbnYYSWRyPxe7RmAptM8n2QO0mc8Zj5jkSn//AasDNYOjWBL4BdmlLA1Sm2Qd5P5clQ1B9g+72rKJvqXD484aInj7s0v/uQLYAw5MlM4hXgRJSx9+iouXlIpi+YHPsHSbFvjSF7vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nui8K5nf; arc=none smtp.client-ip=209.85.128.201
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-7ea35baee37so6009877b3.1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782419070; x=1783023870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaSx917b9Ih36+MYmm85gG9khksXUi5kk9ml14nZ7SI=;
        b=Nui8K5nfcKpNu1Yu4TJc9CWlxC67qt1Kn9vOrMoFnLk3oNxRClScS9t4KM3RT6/KxA
         PovqsKkdE4u+B/HXKutWK+jbipXo+2mAoEOJb9yMlYCNwAb4VMM9eaAkfjXQiUmR2nMv
         +lHvR58XR1jmkCozULuy3ztu1jwJr2PajLvmbS5ZmJsJGVlAR3iXk/DFzGYJSewLrGRJ
         OnAzFv8q6GCOOaG2jXXDAiviQSRiQoF0eBiNVLTK4wQ02NLxiLnFz6rzVWLRjDJVSM1P
         8Ymw2RBmz548fdF6WMgBi+Do81O8oaTFyMooYl+1lebK1asuC+9mSHb7vJk4vKFvFOtr
         4M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782419070; x=1783023870;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZaSx917b9Ih36+MYmm85gG9khksXUi5kk9ml14nZ7SI=;
        b=aeBGxNydVH4hJaUHRSHDcMC/5Yv9bB050Mo2CX+FE6+5YJcaq+tdn4LTiRq/zl1LdQ
         BV31mW+sHbwuO7EzhX6fUMNBUslrL3ToiAqZ/QhjR/AytrcQeU4+78jaa7Qy1eAFkKIG
         hyiZFb89LiZ3OqbCUtLcJRD5rS4eqNlaUBn9kOkAR9kXXViVlEaWZQFcPPNUWlxCcqyw
         YamYkafHRMGiYaaeZrVabGd/nYgrKBV2YW02ytrZv/oMGNcQDysS1k1zGLJ264FHUtZd
         bu9gQ1zXUwWTwATApLKXRzkhkLznV6UcwfvJoKPn9/BcoezrynuCxwia+IwAcyorpkSU
         Xk/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp3bNUhaoljVza8qm1lU4YVslhuy7sEsxsn4vuMjqZgEf4/X9EqCH7Eim/JigCaPWcKx1n2NpTh3qzjrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB4aS9IOHbyduDV1EFEEzfwoVO068mfc41o4B24X/gnFXgrZ1C
	Qr/IbuHOT1U/DztUdxh4ylqjTN4XU90LWA8wZ5mzdCT92II2zggbHGSWQy/Z3m/CZgGvApfVSbn
	91+S5oXjF/8crihh2s62uLp/AZqqU
X-Received: from ywao9.prod.google.com ([2002:a05:690c:e6e9:b0:80a:9749:d2dd])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:690c:d8e:b0:7e8:6d46:a15e with SMTP id 00721157ae682-80a6af82548mr42549557b3.20.1782419069721;
 Thu, 25 Jun 2026 13:24:29 -0700 (PDT)
Date: Thu, 25 Jun 2026 16:24:03 -0400
In-Reply-To: <4b2078a0-9422-467b-b167-9a0b5444f18d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260625202412.2986772-1-briandaniels@google.com>
Subject: Re: [PATCH v4 1/8] media: virtio: Add protocol
From: Brian Daniels <briandaniels@google.com>
To: "Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Brian Daniels <briandaniels@google.com>, acourbot@google.com, adelva@google.com, 
	aesteve@redhat.com, changyeon@google.com, daniel.almeida@collabora.com, 
	eperezma@redhat.com, gnurou@gmail.com, gurchetansingh@google.com, 
	hverkuil@xs4all.nl, jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65667-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:mchehab@kernel.org,m:briandaniels@google.com,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mst@redhat.com,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEC316C87E7

> > +	u32 __reserved;
>=20
> Knowing ~ nothing about virtio with ~ no experience of it I'll offer up=
=20
> a question/statement anyway.
>=20
> Aren't your reservations here a bit conservative ? Would you not be well=
=20
> advised to reserve a bit more space per other virtio protocols ?
>=20
> =E2=9E=9C   grep reserved ./include/uapi/linux/*.h | grep virtio
> ./include/uapi/linux/virtio_balloon.h: *         __u8 reserved[6];
> ./include/uapi/linux/virtio_balloon.h: * In other words, add explicit=20
> reserved fields to align field and
> ./include/uapi/linux/virtio_blk.h:      __u8 reserved[38];
> ./include/uapi/linux/virtio_blk.h:      __u8 reserved[56];
> ./include/uapi/linux/virtio_config.h: * VIRTIO_TRANSPORT_F_END are=20
> reserved for the transport
> ./include/uapi/linux/virtio_crypto.h:   __le32 reserved;
> ./include/uapi/linux/virtio_i2c.h: * Copyright (c) 2021 Intel=20
> Corporation. All rights reserved.
> ./include/uapi/linux/virtio_input.h:    __u8    reserved[5];
> ./include/uapi/linux/virtio_iommu.h:    __u8=20
>         reserved[3];
> ./include/uapi/linux/virtio_iommu.h:    __u8=20
>         reserved[3];
> ./include/uapi/linux/virtio_iommu.h:    __u8=20
>         reserved[3];
> ./include/uapi/linux/virtio_iommu.h:    __u8=20
>         reserved[4];
> ./include/uapi/linux/virtio_iommu.h:    __u8=20
>         reserved[8];
> ./include/uapi/linux/virtio_iommu.h:    __u8=20
>         reserved[4];
> ./include/uapi/linux/virtio_iommu.h:    __u8=20
>         reserved[3];
> ./include/uapi/linux/virtio_iommu.h:    __u8=20
>         reserved[64];
> ./include/uapi/linux/virtio_iommu.h:    __u8=20
>         reserved[3];
> ./include/uapi/linux/virtio_iommu.h:    __u8=20
>         reserved2[4];
> ./include/uapi/linux/virtio_net.h:      __le16 reserved[4];
> ./include/uapi/linux/virtio_net.h:      __le16 reserved;
> ./include/uapi/linux/virtio_net.h:              __le16 reserved[3];
> ./include/uapi/linux/virtio_net.h:      __u8 reserved;
> ./include/uapi/linux/virtio_net.h:      __le16 reserved1;
> ./include/uapi/linux/virtio_pcidev.h: * @VIRTIO_PCIDEV_OP_RESERVED:=20
> reserved to catch errors
> ./include/uapi/linux/virtio_pcidev.h: * @reserved: reserved
> ./include/uapi/linux/virtio_pcidev.h:   __u16 reserved;
> ./include/uapi/linux/virtio_pci.h:      * 2-65535 - reserved
> ./include/uapi/linux/virtio_pci.h:      /* Unused, reserved for future=20
> extensions. */
> ./include/uapi/linux/virtio_pci.h:      __u8 reserved1[12];
> ./include/uapi/linux/virtio_pci.h:      /* Unused, reserved for future=20
> extensions. */
> ./include/uapi/linux/virtio_pci.h:      __u8 reserved2[4];
> ./include/uapi/linux/virtio_pci.h:      __u8 reserved[7];
> ./include/uapi/linux/virtio_pci.h:      __u8 reserved[6];
> ./include/uapi/linux/virtio_pci.h:      __u8 reserved[6];
> ./include/uapi/linux/virtio_pci.h:      __u8 reserved[2];
> ./include/uapi/linux/virtio_pci.h:      __u8 reserved[7];
> ./include/uapi/linux/virtio_pci.h:      __u8 reserved[7];
> ./include/uapi/linux/virtio_pci.h:      __u8 reserved;
> ./include/uapi/linux/virtio_pci.h:                      __le32 reserved;
> ./include/uapi/linux/virtio_pci.h:                      __u8 reserved[6];
> ./include/uapi/linux/virtio_pci.h:                      __le32 reserved;
> ./include/uapi/linux/virtio_pci.h:                      __le32 reserved;
> ./include/uapi/linux/virtio_pci.h:                      __le32 reserved;
> ./include/uapi/linux/virtio_pci.h:      __u8 reserved[7];
> ./include/uapi/linux/virtio_rtc.h: * Copyright (c) 2024 Qualcomm=20
> Innovation Center, Inc. All rights reserved.
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[7];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[5];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[5];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[5];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[7];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[7];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[5];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[5];
> ./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
> ./include/uapi/linux/virtio_spi.h: * Copyright (C) 2025 Qualcomm=20
> Innovation Center, Inc. All rights reserved.
> ./include/uapi/linux/virtio_spi.h: *   other bits are reserved as 0,=20
> 1-bit transfer is always supported.
> ./include/uapi/linux/virtio_spi.h: *   other bits are reserved as 0,=20
> 1-bit transfer is always supported.
> ./include/uapi/linux/virtio_spi.h: * @reserved: for future use.
> ./include/uapi/linux/virtio_spi.h:      __u8 reserved[3];+      u32=20
> __reserved;

I'm not an expert here, but taking a look at those files, the vast majority=
 of
those reserved fields appear to be padding to ensure the struct has 64-bit
alignment, which matches the use here in virtio-media as well.

virtio_pci appears to be the only device that explicitly states the
reserved bytes are for future extensions. Unless there's a good a reason to
expect a future use case where more space is needed, I would prefer to not =
add
more at this time.

