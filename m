Return-Path: <linux-media+bounces-56910-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI28AHfnwmnnnAQAu9opvQ
	(envelope-from <linux-media+bounces-56910-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 20:35:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5A231B949
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 20:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F4C2314E00D
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 19:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1B12DECBF;
	Tue, 24 Mar 2026 19:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwjKFrZS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20E32C11E2
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380242; cv=none; b=bU227Q5Ha2F95/xHkkAiEILasYGgO2kDx3Mx3cDBtI2iEGBk4pPZV3yyZxqW6P45eeCpUQJEbwrFBOPOmejMtWYVpOKAO7o+F0ORf/LvJvyrIJxFP4GIbwHnQ9A87Nmsp5R/5fC2yHkxdsj6ad3ojjb+G3YpRBnaZ4SdwVtxFD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380242; c=relaxed/simple;
	bh=COYTcvWMtZbNgmReV5I4uKrhM4N+yMIz+yCn9rIkSMk=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=hp4McaXBtACSz1oDo+MS3TfpSu+Yq5qgvkve+q6RgrzQYfJFPh1/LfwQKxuMX9pZz9dR7cAj5gG5QLEuIBI2RDuAMr8E5QfmnL0/BWvnTYGh/S8s6PO97dDmUVHzJ9Ztyt/dKdEpXB02MRjmP97Jh3eRY4mIzVfu1olR/CHION4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwjKFrZS; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38c26612508so12722971fa.3
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 12:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774380239; x=1774985039; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=wYMnchnB/TeeKyI/1Ye/NWdU8u0hSMm+QUE/z4pDCe4=;
        b=TwjKFrZSlyUK1FobEQN7cAIIAQNMn3ihFEfsUPWzvMuFbkuiQj6QmLVtJRP/TMyp5u
         6oRwV3NKEyRyi3zwBPA/XFxG+T8k0Xga6BxsQVRP2AVIZdE8aQhByu0q2vmrUKLSOD6e
         mrnyie9HnsmajcEwQHdW25P1TIcvOeB2rYcZE75Semj2UDAcFn6wcCKNvVcW/XYhuGNS
         sOLdVU7QiEm4s4Ig+Bjnza+bv62Bd5gJOEbGt7Y4ItuYSPFxuoN63KEmL6slTGS8e0jf
         BHYztSNeaWhC7RaarcHnKuMlD+sIH1WKd0dBZp4w/En7D2st8jGYyI/8ZnBuSc2vVmJe
         HcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774380239; x=1774985039;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wYMnchnB/TeeKyI/1Ye/NWdU8u0hSMm+QUE/z4pDCe4=;
        b=W+MN8E2cSgrUlwHYQS/3T8aYv0qX7xUGlVH2B5YbhYKrhFD9Mz62Q01CtCvjfNJc11
         QmVShlJjVY+pJ8KQl/3z0Bli0uNPXQej46zBEX+n8drqEnrFUolp4amHutpTixnluWDL
         o8LROH6oAezET/BAHWAv23Erut1nD/CTJjs1HRy5uleDkHl9r1+wE4oaqS9LWP6LDqr3
         KB5la3G/3Fux06GgPMWZyFXGEZwmyXCU5AtzPriIW1HPOHp6VL3+Lo2pq7YXCb89eqI+
         RjUSyuUaR9/np4IFTgiMyZdWg81mHF8RFWliuDi0Sr9jzkoDEA1H5UIitucYwZHkoa8G
         Flpw==
X-Forwarded-Encrypted: i=1; AJvYcCUI6pYUfQrHAjogkl2Zmni8xcSbKFybd4DBA71VYE5bmel5tRDSe0fHtqZYEMUvueYly2xkt1wZHP5tGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9qEsCtonQjN/55kuNsfn8Cosj3gg54rFdJvSi0SeR1V/+4P4y
	WxxL0TRrPRM4ddi2Y4ATUxhzO5HPzOiBLvX1AmdfADrUooudBpcM/IlN
X-Gm-Gg: ATEYQzyxLLBdZCukcRE4lpD3631BvLushKWS5SvRsfh+3YTPs6xsncHq1+W4iSYRrzP
	UTXgLb6jWRydk8UjiyU8QfDKoFZ8qf/ic00tbPp7sjXvEaug3BTcdp98w+IrhZhYlzTrulqrtOA
	BfXoQBvn9Q+V39Cf96GIT8+sOGANEObwBEnzzfcqdzzH+B6YWWkiVFdqqwiPmPmSQuTAZDI3Ccu
	uK6j909LT6XfsT6kCYbYMOmcHu0Jt/nD3/VFXuAWnJ8iUCU4Oc5JHsOhlQ92wRaN4aWIw+YrMO5
	munES4QSgPoE/rqYhDZZq7Vv1eyFjIOdw0JgLnhOexqkO6cwP+gFEHg4DhrsEWt6qt5K7w80VXE
	cTPPdrkUXNmTmsT/IFpzrRhyEnqAIy9ls1x4p/F+AbuayjkK/mcEiVtLfjQvlEPwdEyGyY9185/
	0SQwsp4rcaow2t9ho4zy0=
X-Received: by 2002:a05:651c:4212:b0:38c:4231:91c2 with SMTP id 38308e7fff4ca-38c430c33d1mr1974511fa.10.1774380238610;
        Tue, 24 Mar 2026 12:23:58 -0700 (PDT)
Received: from razdolb ([77.220.204.220])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c34a2db0bsm6416851fa.21.2026.03.24.12.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:23:58 -0700 (PDT)
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
 <acFkAPreOFBvoHid@zed>
User-agent: mu4e 1.10.9; emacs 30.2
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Tomasz Figa
 <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Hans
 Verkuil <hverkuil@xs4all.nl>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Allow non-coherent video capture buffers on
 Rockchip ISP V1
Date: Tue, 24 Mar 2026 22:12:33 +0300
In-reply-to: <acFkAPreOFBvoHid@zed>
Message-ID: <87ecl9f2uv.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[fastmail.com,ideasonboard.com,kernel.org,sntech.de,chromium.org,samsung.com,xs4all.nl,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56910-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikerudenko@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: 6C5A231B949
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi, Jacopo!

On 2026-03-23 at 17:03 +01, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:

> Hello
>
> On Mon, Mar 03, 2025 at 02:40:08PM +0300, Mikhail Rudenko wrote:
>> This small series adds support for non-coherent video capture buffers
>> on Rockchip ISP V1. Patch 1 fixes cache management for dmabuf's
>> allocated by dma-contig allocator. Patch 2 allows non-coherent
>> allocations on the rkisp1 capture queue. Some timing measurements are
>> provided in the commit message of patch 2.
>>
>> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
>
> I regularly get back to this series everytime I have to reason about
> the caching policies in vb2..
>
> Is there any reason why it didn't get in ?

My impression is that all the review comments were addressed, but these
patches somehow fell through the cracks. I can rebase and post v5 if any
maintainer is interested in picking it up.

>> ---
>> Changes in v4:
>> - rebase to media/next
>> - use `direction` instead of `buf->dma_dir` in dma_sync_sgtable_*
>> - Link to v3: https://lore.kernel.org/r/20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com
>>
>> Changes in v3:
>> - ignore skip_cache_sync_* flags in vb2_dc_dmabuf_ops_{begin,end}_cpu_access
>> - invalidate/flush kernel mappings as appropriate if they exist
>> - use dma_sync_sgtable_* instead of dma_sync_sg_*
>> - Link to v2: https://lore.kernel.org/r/20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com
>>
>> Changes in v2:
>> - Fix vb2_dc_dmabuf_ops_{begin,end}_cpu_access() for non-coherent buffers.
>> - Add cache management timing information to patch 2 commit message.
>> - Link to v1: https://lore.kernel.org/r/20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com
>>
>> ---
>> Mikhail Rudenko (2):
>>       media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
>>       media: rkisp1: Allow non-coherent video capture buffers
>>
>>  .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++++++++
>>  .../platform/rockchip/rkisp1/rkisp1-capture.c      |  1 +
>>  2 files changed, 23 insertions(+)
>> ---
>> base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
>> change-id: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba
>>
>> Best regards,
>> --
>> Mikhail Rudenko <mike.rudenko@gmail.com>
>>
>>


--
Best regards,
Mikhail Rudenko

