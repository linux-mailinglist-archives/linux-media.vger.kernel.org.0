Return-Path: <linux-media+bounces-7469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C56908857E7
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 12:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 392D7B220C2
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 11:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E732D58AD3;
	Thu, 21 Mar 2024 11:13:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FD457877
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711019621; cv=none; b=oCl7iSUf/mlyTxRYutONzhcug7Oa7Q2vAk8lACgIWiPMqJ8IaFeDaTyVgm2U9iomNSLuvcU4Bp+5FxfecTOMVn0pBVbXbq/ylzPNc+3sfgB2LlQDk82OKKhu2eWC6TF2TCEh9Qi9ZcJ2o/BRRj9oLrOl2GxmgOMP+rGpNNpgSac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711019621; c=relaxed/simple;
	bh=oGluUM93Y5yTPD8CTHtbS2JQzykhQk/DhDo828g5FjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krMh3JQDcQjZdERNSCkgeJ3YwbkeItPI+rjoekVn5LB9sujPThyQ5/bwyGW3VeAo8P49FNe63Fv9nqFqzc2IJLYvQVm5y4WTph9AmiHBGpD4RQNELEoAqbDwt88QVfAyTJG/aFKh0uMM/GSyiMwymumHJIqruLJg7fbbL5dlcVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63290C433F1;
	Thu, 21 Mar 2024 11:13:40 +0000 (UTC)
Message-ID: <f155ac29-7641-44f0-88f0-53bc9954dfdf@xs4all.nl>
Date: Thu, 21 Mar 2024 12:13:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR 6.9] Mediatek MT8186 encoder & media fix
Content-Language: en-US, nl
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: linux-media@vger.kernel.org
References: <20240313132019.6o6ave7mfy3sdvod@basti-XPS-13-9310>
 <17bca73f-9dd1-4fb0-a770-55244a9bd9d9@xs4all.nl>
 <13686368-326a-4d62-aea4-0ef04b247386@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwECACgFAlQ84W0CGwMFCRLMAwAGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAACEJEL0tYUhmFDtMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wT
 7w//frEmPBAwu3OdvAk9VDkH7X+7RcFpiuUcJxs3Xl6jpaA+SdwtZra6W1uMrs2RW8eXXiq/
 80HXJtYnal1Y8MKUBoUVhT/+5+KcMyfVQK3VFRHnNxCmC9HZV+qdyxAGwIscUd4hSlweuU6L
 6tI7Dls6NzKRSTFbbGNZCRgl8OrF01TBH+CZrcFIoDgpcJA5Pw84mxo+wd2BZjPA4TNyq1od
 +slSRbDqFug1EqQaMVtUOdgaUgdlmjV0+GfBHoyCGedDE0knv+tRb8v5gNgv7M3hJO3Nrl+O
 OJVoiW0G6OWVyq92NNCKJeDy8XCB1yHCKpBd4evO2bkJNV9xcgHtLrVqozqxZAiCRKN1elWF
 1fyG8KNquqItYedUr+wZZacqW+uzpVr9pZmUqpVCk9s92fzTzDZcGAxnyqkaO2QTgdhPJT2m
 wpG2UwIKzzi13tmwakY7OAbXm76bGWVZCO3QTHVnNV8ku9wgeMc/ZGSLUT8hMDZlwEsW7u/D
 qt+NlTKiOIQsSW7u7h3SFm7sMQo03X/taK9PJhS2BhhgnXg8mOa6U+yNaJy+eU0Lf5hEUiDC
 vDOI5x++LD3pdrJVr/6ZB0Qg3/YzZ0dk+phQ+KlP6HyeO4LG662toMbFbeLcBjcC/ceEclII
 90QNEFSZKM6NVloM+NaZRYVO3ApxWkFu+1mrVTXOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAECAA8FAlQ84W0CGwwFCRLMAwAAIQkQvS1hSGYUO0wW
 IQQFLN57whUFO2ifG8q9LWFIZhQ7TA1WD/9yxJvQrpf6LcNrr8uMlQWCg2iz2q1LGt1Itkuu
 KaavEF9nqHmoqhSfZeAIKAPn6xuYbGxXDrpN7dXCOH92fscLodZqZtK5FtbLvO572EPfxneY
 UT7JzDc/5LT9cFFugTMOhq1BG62vUm/F6V91+unyp4dRlyryAeqEuISykhvjZCVHk/woaMZv
 c1Dm4Uvkv0Ilelt3Pb9J7zhcx6sm5T7v16VceF96jG61bnJ2GFS+QZerZp3PY27XgtPxRxYj
 AmFUeF486PHx/2Yi4u1rQpIpC5inPxIgR1+ZFvQrAV36SvLFfuMhyCAxV6WBlQc85ArOiQZB
 Wm7L0repwr7zEJFEkdy8C81WRhMdPvHkAIh3RoY1SGcdB7rB3wCzfYkAuCBqaF7Zgfw8xkad
 KEiQTexRbM1sc/I8ACpla3N26SfQwrfg6V7TIoweP0RwDrcf5PVvwSWsRQp2LxFCkwnCXOra
 gYmkrmv0duG1FStpY+IIQn1TOkuXrciTVfZY1cZD0aVxwlxXBnUNZZNslldvXFtndxR0SFat
 sflovhDxKyhFwXOP0Rv8H378/+14TaykknRBIKEc0+lcr+EMOSUR5eg4aURb8Gc3Uc7fgQ6q
 UssTXzHPyj1hAyDpfu8DzAwlh4kKFTodxSsKAjI45SLjadSc94/5Gy8645Y1KgBzBPTH7Q==
In-Reply-To: <13686368-326a-4d62-aea4-0ef04b247386@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/03/2024 12:03 pm, AngeloGioacchino Del Regno wrote:
> Il 21/03/24 11:55, Hans Verkuil ha scritto:
>> On 13/03/2024 2:20 pm, Sebastian Fricke wrote:
>>> Hey Mauro & Hans,
>>>
>>> just a small media change, a little DT binding change and otherwise DTS
>>> changes.
>>>
>>> Please pull.
>>>
>>> The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:
>>>
>>>    media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9-mt8186-video-encoder
>>>
>>> for you to fetch changes up to 48241e83cc161c24745a04c5660808b31a0ffe77:
>>>
>>>    arm64: dts: mediatek: mt8186: Add venc node (2024-03-09 15:50:26 +0100)
>>>
>>> ----------------------------------------------------------------
>>> One small media fix and a DT binding addition for a video encoder on the
>>> MT8186
>>>
>>> ----------------------------------------------------------------
>>> Eugen Hristev (5):
>>>        media: mediatek: vcodec: fix possible unbalanced PM counter
>>>        dt-bindings: media: mtk-vcodec-encoder: fix non-vp8 clock name
>>>        arm64: dts: mediatek: mt8192: fix vencoder clock name
>>>        dt-bindings: media: mtk-vcodec-encoder: add compatible for mt8186
>>>        arm64: dts: mediatek: mt8186: fix VENC power domain clocks
>>>
>>> Kyrie Wu (1):
>>>        arm64: dts: mediatek: mt8186: Add venc node
>>
>> I'm confused: I didn't check all 6 patches, but at least several have
>> already been merged in the mainline kernel.
>>
>> At least the dt-bindings patches must have come through AngeloGioacchino Del Regno
>> based on the SoB, instead of going through the media maintainers.
>>
>> The "media: mediatek: vcodec: fix possible unbalanced PM counter" patch, however,
>> is marked as Accepted, but it isn't in mainline.
>>
>> I *think* that Angelo intended to merge the dts changes only, and accidentally
>> included the dt-bindings as well?
>>
> 
> Correct.
> 
> At this point there's just one commit to pick for you (fix possible unbalanced...)
> Will be more careful next time, sorry about that.

Ah, OK.

I changed the state of that one commit to 'New' in patchwork. Sebastian, can you make
a new PR containing that patch?

Regards,

	Hans

> 
> Cheers,
> Angelo
> 
>> Regardless, this PR is messed up. Sebastian, can you dig into this?
>>
>> Regards,
>>
>>     Hans
>>
>>>
>>>   .../bindings/media/mediatek,vcodec-encoder.yaml    | 31 +++++++++++-----------
>>>   arch/arm64/boot/dts/mediatek/mt8186.dtsi           | 23 +++++++++++++++-
>>>   arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  2 +-
>>>   .../mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c    |  4 ++-
>>>   .../mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h    |  2 +-
>>>   .../platform/mediatek/vcodec/encoder/venc_drv_if.c |  5 +++-
>>>   6 files changed, 47 insertions(+), 20 deletions(-)
>>>
>>
> 


