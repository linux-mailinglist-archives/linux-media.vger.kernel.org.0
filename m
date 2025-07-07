Return-Path: <linux-media+bounces-36961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96448AFAEA6
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 10:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47A90189F8A7
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 08:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C98828A3E1;
	Mon,  7 Jul 2025 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="KTLmXjQL"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A472E36F3
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751877037; cv=none; b=IJrE5hxm5WUxBtxGXRxuijy3uSQS5v9NfYh+O47EZcXBrlokKHINTYwLe8JF+znVD7A2XQOMh6NJRMBmmxdkzvqRMiWOddjj2HMlg1CGNd3aI0AzA5dEoSa0t1kPmK0xkuHSswyBawpeJvJDUrF+5dmAiYTkjk91+CvVGDizQMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751877037; c=relaxed/simple;
	bh=mKkyxlEXnSJ15EY7mg0EbhGmUJtaDiNOQqMX7i1xHwo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=TmIVNaAysADdls2v1Q4HCWr3dL//SvTmn/8pJXrQ9y+sr4lWGVYGQS373E+bzfj/bNKO8jQ3Ex+Z0u2u4ZNU/XRtpm+pUJkjWdYm83g5iJMBICu+NZC1yoS/AZbHf1CZskjoyXvN2/frTsff2b1KKKw11FTirJWcdFcNZVrmb/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=KTLmXjQL; arc=none smtp.client-ip=195.121.94.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 165d126e-5b0d-11f0-8ecb-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 165d126e-5b0d-11f0-8ecb-005056994fde;
	Mon, 07 Jul 2025 10:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:subject:from:to:mime-version:date:message-id;
	bh=shE9zbZrN5BaqszEWWbOaSbfWvjCnUEc9EMceuHcKjM=;
	b=KTLmXjQL4cmrnIJ27AglYZOzisDS9+B8O5sGZfH8k1PX3l/32UAGv+b7XjsLVKihmkuW0359lr6aL
	 GlIJ9OU/Feb86Dzoda8PHVh99YuMPWe8bmPah1lUio501kuzcBLbMX54W8+FgWWO1eDoD89Z1CL0tg
	 dhlJxuhQQNNZCD2Uwjcb2+ZON6ZwCTcoGifqupmYaIQsBVp4DYD4OcAT95bL/ssKZoaI9K32dM/Fmx
	 MH3LJzLV4aEO47E7frkDdYpYhFDdfevAaZbGXQR9FjXrxYM5fZ6Mc2cz9Pq9Y601ZuaJSMBImmCJP0
	 VqmOfiXdBXMoqYmzh++KeMTV/q7QnfA==
X-KPN-MID: 33|KjxBAqlutzw5rKRWYpg4qJtqz2qybFn66p6ipHEIfazpjQ/9qUHG8ezU3C+FsEW
 XAtTBirLly7Gpy+D5BWCStR1t9fmAOwfLC+EEh+ce0CI=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|ZptS94URSn4ZyJhOwgvCGoLnWWrdClp/B0IMm+OPMwbhI6b9xUPpKxgjXNKDCCT
 Tkbg115hoSmP8RNh1mGUmew==
Received: from [192.168.2.10] (unknown [178.74.16.2])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id a5288926-5b0c-11f0-9820-00505699d6e5;
	Mon, 07 Jul 2025 10:30:32 +0200 (CEST)
Message-ID: <5a54f718-da22-4efd-a9d4-b5788819c090@xs4all.nl>
Date: Mon, 7 Jul 2025 10:30:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.17] vivid fix + .mailmap update
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

Two patches I'd like to get in for v6.17:

One updates the .mailmap, preparing for my move to use hverkuil@kernel.org as my
main kernel development address. The second fixes a bug in vivid. Note that this
second patch will fail with the standard v4l2-compliance, so once it is applied
v4l-utils needs to be updated with this patch:

https://patchwork.linuxtv.org/project/linux-media/patch/48da93b2-ff28-4b73-a462-4d03b4ae7ae1@xs4all.nl/

The pipeline using the local branch of v4l-utils with that patch is here:

https://gitlab.freedesktop.org/linux-media/users/hverkuil/-/pipelines/1465073

Regards,

	Hans

The following changes since commit a8598c7de1bcd94461ca54c972efa9b4ea501fb9:

media: ipu7: Drop IPU8 PCI ID for now (2025-07-04 08:22:32 +0200)

are available in the Git repository at:

git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.17p

for you to fetch changes up to 598c7ad29e906790b965c1ea43bd2c3cc9dc7989:

media: vivid: fix wrong pixel_array control size (2025-07-07 08:30:32 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
.mailmap: update Hans Verkuil's email addresses
media: vivid: fix wrong pixel_array control size

.mailmap                                         | 5 +++--
drivers/media/test-drivers/vivid/vivid-ctrls.c   | 3 ++-
drivers/media/test-drivers/vivid/vivid-vid-cap.c | 4 ++--
3 files changed, 7 insertions(+), 5 deletions(-)

