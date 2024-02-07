Return-Path: <linux-media+bounces-4783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E3084C453
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 06:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E345286EF6
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 05:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F06014AAD;
	Wed,  7 Feb 2024 05:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQBU209/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B511CD13
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 05:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707282625; cv=none; b=i4GgJX8gjD476jBM2teQOdC4OrsFXk90z+gRiqqKkw1lH8RLsYWwxwRmuKr2aSEc3H9gGwelYO3zS+oc0s6ppBLrtV2gdWpImpxFY07GjaMx68f/+FEg8bHv4APDoI0ju6YXIuBmCp6OmhtkV0fE/B8qRSewssc3Q4B6KiT6JRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707282625; c=relaxed/simple;
	bh=9kzClG/YImWCoAj2j+dyUXX/19b1doYINZLpUDMpk6I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bxXQ/ZN6t1Oi8NfTd2sN6JjOSyTfrTKlLIw0Bb41Y79Jg9Z8OUtdvAMN3/UM7vrwPHuo2+i+YoVayzxNyP5O8gAGi0TquzxgPB0cKvEMsq2Pr9LE8aOSeEFLZbK11TpuZEZybzZ3za3zhz3/YM6LwwFdu8FAOzTxOcOmfkuTOA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQBU209/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0208C433F1;
	Wed,  7 Feb 2024 05:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707282625;
	bh=9kzClG/YImWCoAj2j+dyUXX/19b1doYINZLpUDMpk6I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pQBU209/at0K9ZPWIjGXE4XjJTIYiBn/tK8d9hoIHWQmx9piGWpO44iBLU7fZRBNc
	 aR0QHaWdSSvbanTt+1KfxNfcU4Nut7HNtByz4TK/thD13lByJ/jYTE2y1iscLs9kHq
	 et8SYJJ+yarwXaxiDBHQpiUSKlWgRiFDqVubwgIfy9A/f40iZ0/RVstfMObLvAzR3u
	 pmieIyOhe/nuLtaiazVdUZZGmX2XGevTPa3jeO0mIy9SXwvbVCQNfNXNKdI4ir8ZGA
	 L8QVf4l9Vt+Lgo/jxd84rxVSko9DvGI34dIT0UF6DB2jAelIsvYk73FABnLZKcMiHa
	 xJHlgUa+kcJGw==
Date: Wed, 7 Feb 2024 06:10:20 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Stefan Herdler <herdler@nurfuerspam.de>
Cc: hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, smoch@web.de,
 tmn505@gmail.com, vinschen@redhat.com
Subject: Re: [PATCH v4 0/6] media: docs: uAPI: dvb/decoder: completing the
 documentation
Message-ID: <20240207061020.0a6fa3bb@coco.lan>
In-Reply-To: <20240128233249.32794-1-herdler@nurfuerspam.de>
References: <20230327192826.65ae299d@sal.lan>
	<20240128233249.32794-1-herdler@nurfuerspam.de>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Stefan,

Em Mon, 29 Jan 2024 00:32:43 +0100
Stefan Herdler <herdler@nurfuerspam.de> escreveu:

> This is basically a resend of v3 after 6 month, with some minor updates.
> Changes since v3:
> * Adjust title and description to better match existing documentation.
> * Fix warnings from kernel test robot.
>   (At least I hope it is fixed now, I couldn't reproduce this warning.)
> 
> No changes to the text it self.
> The layout is still identical since v1, just split into multiple patches.
> My comments of v3 attached below, they refer to Mauros comments[3] to
> v2 and still fully apply.

Patch series applied. I opted to reorder the series placing patch 1 at the
end, as otherwise it would cause bisect issues, as the index would be
trying to reference non-existing files.

Thank you for the series!

Regards,
Mauro


> 
> [3: https://patchwork.kernel.org/project/linux-media/patch/decd5d71-f06e-5873-5ebf-7028107f65ee@nurfuerspam.de/]
> 
> 
> [PATCH v3] (July '23) ---------------------------------------------------
> 
> Changes since v2:
> * Split the patch into a patch series.
> * Incorporate the changes requested.
> * Style updates to better match the existing documentation.
> * And a lot of small fixes.
> 
> 
> Hi Mauro,
> 
> it took a little longer then expected, but I didn't had much time in spare
> for this. I'm pretty much occupied by other things at the moment.
> The winter season would be better for things like this, but I try to
> finish it as quick as possible.
> 
> I went through your mail point by point and I'm confident, that I was able
> to sort out your questions now. At least I don't see anything that need to
> be improved anymore.
> The work has been done in a lot of small blocks over a pretty long period
> after my daily work, mostly late at night. Despite double checking
> everything, I maybe still have missed something. I hope it is not too
> much.
> 
> For usage it has been checked against the known projects using the DVB
> decoder APIs:
> * The AV7110 kernel driver.
> * The out of tree driver for the HD full featured cards.[1]
> * The "Enigma2" sources from openatv team.[2]
>   (The drivers of the boxes are binary only.)
> 
> Possibly unused items have been listed in the comment of the patches.
> Please take this lists with a pinch of salt. With the number of items
> checked, it is pretty easy to miss an occurrence or have a false positive.
> Although I've done my best, there is still the chance that I've missed an
> use case.
> 
> I tried to complete the documentation of this unused definition too.
> Most information had been collect anyway and writing it down wasn't that
> much of effort.
> 
> Removing the definition and documentation later at once is always an
> option.
> I would prefer to do it this way, if something has to be removed.
> It is easier to revert the change in case of a regression.
> If necessary I can provide the patches too.
> 
> Regards
> Stefan
> 
> [1: https://github.com/s-moch/linux-saa716x]
> [2: https://github.com/openatv/enigma2/tree/master]
> 
> 
> 
> Stefan Herdler (6):
>   Add documentation for legacy DVB decoder API
>   Add documentation for osd.h
>   Add documentation for audio.h (data types)
>   Add documentation for audio.h (function calls)
>   Add documentation for video.h (data types)
>   Add documentation for video.h (function calls)
> 
>  .../media/dvb/legacy_dvb_apis.rst             |    1 +
>  .../media/dvb/legacy_dvb_audio.rst            | 1642 +++++++++++
>  .../media/dvb/legacy_dvb_decoder_api.rst      |   61 +
>  .../media/dvb/legacy_dvb_osd.rst              |  883 ++++++
>  .../media/dvb/legacy_dvb_video.rst            | 2430 +++++++++++++++++
>  5 files changed, 5017 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
>  create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_decoder_api.rst
>  create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_osd.rst
>  create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
> 
> --
> 2.34.0
> 
> 



Thanks,
Mauro

