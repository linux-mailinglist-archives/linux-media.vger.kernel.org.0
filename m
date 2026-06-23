Return-Path: <linux-media+bounces-65425-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B2MXNhDbOWoJyQcAu9opvQ
	(envelope-from <linux-media+bounces-65425-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 03:02:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA676B3142
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 03:02:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GtZY55KG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65425-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65425-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B26963052FFB
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 00:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1286B385D60;
	Tue, 23 Jun 2026 00:57:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8161C377019;
	Tue, 23 Jun 2026 00:57:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782176271; cv=none; b=YXw/U0HIx12Kyy7oqHVvNu6yScq1qDnnTTQuTP+BdIn75SgLl2OFbBcedADGlWbrTpl/e0ZgBcH8CRmoTLtGHfelssxE/lD/0ljY0ppfGcJqggki5Wp3SBorus6SYt/YdWmjWSJtxA15HhhKD0IihXNsIX1dNUJ91m0Y1JHG7L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782176271; c=relaxed/simple;
	bh=m1g4xKHZr+EAT6GJjdEilXTeThpVvSQcrcQXopN3Il4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WINWdsgBOUbe1DWpMoVWwfpIkVuxH/bwhEa48b0xAnRwVUHo6keC3CkggXPnq60InVl4NwrB3FQ+cHrQGbX2IW4iFVvwHOQ0/xbFbW6gM0cs3yIWQsGv8oXfvC9N8d+oOHjpqqVC/SwWzCZytmgyoPhFa7u+GcUketnQQxFDVSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtZY55KG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D931F000E9;
	Tue, 23 Jun 2026 00:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782176270;
	bh=3alYUOb6C/Wbd5vFlD2KNW62xIV+RJoXmu22bGohqYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GtZY55KGabENmhM5ryKwKJTdpNIC/x9joxVpX4SE5xhlx4YgavXU4kmtkQzpC/+TJ
	 7+71qLz9wPWp6IFiJSFzzRDGApBG6qqkuBaN9u1Iz+L8hj6VUPkjhJTySBigjkCXSI
	 oq1MmZzfsnnpVTESIFfj4EYG/WcoaB1DvqaGek/9kQXa1rmddoWte3JNSFcy8VUwt0
	 bEibgPXpDEQ76rxsGcGrPnaEjuRSa2IYRXRVXP3N2yZ1k1iW3s9JjAvZzico/ZafKa
	 Z6OIuyOkdUA00yEEr08dxHGZhjZVIC19Fv0h7dlUNoUlwq6dCJFTtU9PTkpKYc5iDi
	 bigIevvK9iKIQ==
Message-ID: <4b2078a0-9422-467b-b167-9a0b5444f18d@kernel.org>
Date: Tue, 23 Jun 2026 01:57:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] media: virtio: Add protocol
To: Brian Daniels <briandaniels@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: acourbot@google.com, adelva@google.com, aesteve@redhat.com,
 changyeon@google.com, daniel.almeida@collabora.com, eperezma@redhat.com,
 gnurou@gmail.com, gurchetansingh@google.com, hverkuil@xs4all.nl,
 jasowang@redhat.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com,
 virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
References: <20260622204343.1994418-1-briandaniels@google.com>
 <hJjpGSIl7zQxFjql7x9Ooc1a5OsyIEnxXsz6gynzk3FL45qMJ5wlAkygV66lmz7Gtg56uSrkn6MDlzukDS4O8A==@protonmail.internalid>
 <20260622204343.1994418-2-briandaniels@google.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260622204343.1994418-2-briandaniels@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65425-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:briandaniels@google.com,m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mst@redhat.com,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AA676B3142

On 22/06/2026 21:43, Brian Daniels wrote:
> +	u32 __reserved;

Knowing ~ nothing about virtio with ~ no experience of it I'll offer up 
a question/statement anyway.

Aren't your reservations here a bit conservative ? Would you not be well 
advised to reserve a bit more space per other virtio protocols ?

➜   grep reserved ./include/uapi/linux/*.h | grep virtio
./include/uapi/linux/virtio_balloon.h: *         __u8 reserved[6];
./include/uapi/linux/virtio_balloon.h: * In other words, add explicit 
reserved fields to align field and
./include/uapi/linux/virtio_blk.h:      __u8 reserved[38];
./include/uapi/linux/virtio_blk.h:      __u8 reserved[56];
./include/uapi/linux/virtio_config.h: * VIRTIO_TRANSPORT_F_END are 
reserved for the transport
./include/uapi/linux/virtio_crypto.h:   __le32 reserved;
./include/uapi/linux/virtio_i2c.h: * Copyright (c) 2021 Intel 
Corporation. All rights reserved.
./include/uapi/linux/virtio_input.h:    __u8    reserved[5];
./include/uapi/linux/virtio_iommu.h:    __u8 
        reserved[3];
./include/uapi/linux/virtio_iommu.h:    __u8 
        reserved[3];
./include/uapi/linux/virtio_iommu.h:    __u8 
        reserved[3];
./include/uapi/linux/virtio_iommu.h:    __u8 
        reserved[4];
./include/uapi/linux/virtio_iommu.h:    __u8 
        reserved[8];
./include/uapi/linux/virtio_iommu.h:    __u8 
        reserved[4];
./include/uapi/linux/virtio_iommu.h:    __u8 
        reserved[3];
./include/uapi/linux/virtio_iommu.h:    __u8 
        reserved[64];
./include/uapi/linux/virtio_iommu.h:    __u8 
        reserved[3];
./include/uapi/linux/virtio_iommu.h:    __u8 
        reserved2[4];
./include/uapi/linux/virtio_net.h:      __le16 reserved[4];
./include/uapi/linux/virtio_net.h:      __le16 reserved;
./include/uapi/linux/virtio_net.h:              __le16 reserved[3];
./include/uapi/linux/virtio_net.h:      __u8 reserved;
./include/uapi/linux/virtio_net.h:      __le16 reserved1;
./include/uapi/linux/virtio_pcidev.h: * @VIRTIO_PCIDEV_OP_RESERVED: 
reserved to catch errors
./include/uapi/linux/virtio_pcidev.h: * @reserved: reserved
./include/uapi/linux/virtio_pcidev.h:   __u16 reserved;
./include/uapi/linux/virtio_pci.h:      * 2-65535 - reserved
./include/uapi/linux/virtio_pci.h:      /* Unused, reserved for future 
extensions. */
./include/uapi/linux/virtio_pci.h:      __u8 reserved1[12];
./include/uapi/linux/virtio_pci.h:      /* Unused, reserved for future 
extensions. */
./include/uapi/linux/virtio_pci.h:      __u8 reserved2[4];
./include/uapi/linux/virtio_pci.h:      __u8 reserved[7];
./include/uapi/linux/virtio_pci.h:      __u8 reserved[6];
./include/uapi/linux/virtio_pci.h:      __u8 reserved[6];
./include/uapi/linux/virtio_pci.h:      __u8 reserved[2];
./include/uapi/linux/virtio_pci.h:      __u8 reserved[7];
./include/uapi/linux/virtio_pci.h:      __u8 reserved[7];
./include/uapi/linux/virtio_pci.h:      __u8 reserved;
./include/uapi/linux/virtio_pci.h:                      __le32 reserved;
./include/uapi/linux/virtio_pci.h:                      __u8 reserved[6];
./include/uapi/linux/virtio_pci.h:                      __le32 reserved;
./include/uapi/linux/virtio_pci.h:                      __le32 reserved;
./include/uapi/linux/virtio_pci.h:                      __le32 reserved;
./include/uapi/linux/virtio_pci.h:      __u8 reserved[7];
./include/uapi/linux/virtio_rtc.h: * Copyright (c) 2024 Qualcomm 
Innovation Center, Inc. All rights reserved.
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[7];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[5];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[5];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[5];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[7];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[7];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[5];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[5];
./include/uapi/linux/virtio_rtc.h:      __u8 reserved[6];
./include/uapi/linux/virtio_spi.h: * Copyright (C) 2025 Qualcomm 
Innovation Center, Inc. All rights reserved.
./include/uapi/linux/virtio_spi.h: *   other bits are reserved as 0, 
1-bit transfer is always supported.
./include/uapi/linux/virtio_spi.h: *   other bits are reserved as 0, 
1-bit transfer is always supported.
./include/uapi/linux/virtio_spi.h: * @reserved: for future use.
./include/uapi/linux/virtio_spi.h:      __u8 reserved[3];+      u32 
__reserved;

---
bod

