Return-Path: <linux-media+bounces-7773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 527D188AAE7
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 18:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 854861C3ACDF
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1753C13E027;
	Mon, 25 Mar 2024 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="3C962DJS"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F5912FF60
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711381482; cv=none; b=U4uJXFqYbdD5AVIj4WrjbdxTdwkXHkARljp99o7FG17Cyh8kG3I4wQAjhxNaSy6JiTn46tPkoFyHg/iFft+tx7DisgWAFiGJgupv4LEpd+PRH1P2uqJFfTQMaDToOy6IClmIMwboGgFSxefqjtnWFp41im1G8q/xiUmR8zqZCEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711381482; c=relaxed/simple;
	bh=raoI2ejuGmCM2lK0/cpK13yiR9ZLr6oIjccRo3EftjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xeqx1k2a+Th7Oru6mtD7G1XbwYN97UbwvpzGPBQbm0hS6XEU6bd28gNJFa7INJWM5jcor6ouKDtTCYqj4G28pzvdsDMluQb1EEITBQRCXtFBn0WBjzepEzYDiIc2vRS2Sk9wRN004+bxscFaTaA0HaYhjx9A22M8X4U9Bv8IcAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=3C962DJS; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711381479;
	bh=raoI2ejuGmCM2lK0/cpK13yiR9ZLr6oIjccRo3EftjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=3C962DJSJNc7TwFB2RN1EbwszvkXzIczxUSYVSy4dHLomOfzceMRAgxVZWqQ38EVP
	 mbaGWYVav2Jei4sd7ukZPZta/9dO92sMlG4RtIJFZlx9Bmm+wVN4qPqYnwfU9P2xfT
	 p/u5JMzyWoCodjwyPaqhNxpyg/ISID1KcR03K+jyDwQA9v3eQPDwXYJzsKrpmyg95K
	 1FnmT7OGwmkiyco/RA5b8oRcQLvASHgswk1VyTNHprjGgKpGmjfAkB367ABylBE1Ng
	 psNk+5Tlb6TuuwYaT+e3QAsaVxMgXn/NifWiF27PPcqj/o0w+VUNMHgvMXu1xeaAJi
	 /FPUezs6XoJyg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E7D7A37813B7;
	Mon, 25 Mar 2024 15:44:38 +0000 (UTC)
Date: Mon, 25 Mar 2024 16:44:32 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 6.9] Various Mediatek VCodec fixes
Message-ID: <20240325154432.w2zhseliz2m3dpwy@basti-XPS-13-9310>
References: <20240315132549.vbhui74yxjg2t36v@basti-XPS-13-9310>
 <172268d7-f259-4098-bb0d-c33b9ee4a4e1@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172268d7-f259-4098-bb0d-c33b9ee4a4e1@xs4all.nl>

Hey Hans,

On 25.03.2024 10:30, Hans Verkuil wrote:
>Hi Sebastian,
>
>Are these fixes for v6.9 or can these be merged for v6.10?

I was hoping for them to land in 6.9 but if that doesn't work that is
fine for me as well.

>
>Not all of these patches have a 'Fixes' tag, perhaps they should have it?

No the tags are correct, do you want me to strictly only mix patches
with fixes tags or only patches without fixes tags?

>
>Regards,
>
>	Hans

Greetings,
Sebastian

>
>On 15/03/2024 2:25 pm, Sebastian Fricke wrote:
>> Hey Hans & Mauro,
>>
>> this set contains 3 fixes for two kinds of Kernel panic, one fix to be
>> able to access the last element of a list and one fix to be able to
>> access the high bits of a register.
>>
>> Please pull.
>>
>> The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:
>>
>>   media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9-mediatek-various-fixes
>>
>> for you to fetch changes up to 27821568df7da25b1f454cf5461ad4b428df536e:
>>
>>   media: mediatek: vcodec: support 36 bits physical address (2024-03-15 14:14:08 +0100)
>>
>> ----------------------------------------------------------------
>> Various Fixes for Mediatek VCodec
>>
>> ----------------------------------------------------------------
>> Irui Wang (1):
>>       media: mediatek: vcodec: Handle VP9 superframe bitstream with 8 sub-frames
>>
>> Nicolas Dufresne (1):
>>       media: mediatek: vcodec: Fix oops when HEVC init fails
>>
>> Yunfei Dong (3):
>>       media: mediatek: vcodec: adding lock to protect decoder context list
>>       media: mediatek: vcodec: adding lock to protect encoder context list
>>       media: mediatek: vcodec: support 36 bits physical address
>>
>>  .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c |  8 ++++----
>>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     |  5 +++++
>>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 ++
>>  .../mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c     |  2 +-
>>  .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c |  2 +-
>>  .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c | 11 ++++++-----
>>  .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        |  4 ++--
>>  drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c  |  2 ++
>>  .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     |  5 +++++
>>  .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 ++
>>  drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c  |  2 ++
>>  11 files changed, 32 insertions(+), 13 deletions(-)
>>
>

