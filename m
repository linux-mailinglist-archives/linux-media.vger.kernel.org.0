Return-Path: <linux-media+bounces-12532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74158FB62C
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 16:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 059BF1C23AFF
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 14:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C945014883F;
	Tue,  4 Jun 2024 14:47:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70CF13CFA4
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512422; cv=none; b=k0jFBfcUnC0p93GtpI8jm6zfraVQZhrTqpzi97F0Fx5cTPbGOeOwKq28yQalnyrUGCmwwUQRM7h8axHECu9IGiForY08bipBnSBJ27yPeb4oZXEwuR/nC3iZoyFs/fKcc0VZnCz08kPjqlQ2CzbHh2wjkZi9LLfkA8T2xTLmvAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512422; c=relaxed/simple;
	bh=qY/L5//uBLRxx/tKtfZ+Q7vY9vnenY//rfL5ZFNjsm8=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=twj+71nU+zR/9an+sogczp9SuriRlzev3X1WU9Ybg0Lxks7kO+w1mtlYmedXxtu9S9OZJPqwLgcpf7q1IpDPeJ/6lKqTsevC2yFjhzRaWLWO9iSmvAXgQZuzSVkTcU2Xk+xiLwd3lsaRpNmvtHqa6hyMLY59f4vLKpk6g5g74CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sEVRD-0006lK-2r;
	Tue, 04 Jun 2024 14:46:59 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sEVRC-001DOb-3A;
	Tue, 04 Jun 2024 14:46:59 +0000
Date: Tue, 4 Jun 2024 14:46:59 +0000 (UTC)
From: Jenkins Builder Robot <jenkins@linuxtv.org>
Reply-To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org
To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Message-ID: <1530684487.4.1717512419774@builder.linuxtv.org>
In-Reply-To: <976284328.2.1717486675286@builder.linuxtv.org>
References: <976284328.2.1717486675286@builder.linuxtv.org>
Subject: [Jenkins] stage-drivers-build #203: build failed for clang15
 allmodconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3_1064223398.1717512419728"
X-Jenkins-Job: stage-drivers-build

------=_Part_3_1064223398.1717512419728
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Some tests failed:
	PASS: arm32 allmodconfig
	PASS: arm32 allyesconfig
	PASS: x86_64 allyesconfig
	PASS: x86_64 allmodconfig
	PASS: x86_64 no PM
	PASS: arm64 allyesconfig
	PASS: arm64 allmodconfig
	FAIL: clang15 allmodconfig

GENERAL INFO

BUILD SUCCESSFUL
Build URL: https://builder.linuxtv.org/job/stage-drivers-build/203/
Project: stage-drivers-build
Date of build: Tue, 4 Jun 2024 14:30:06 GMT
Build duration: 16 min and counting


CHANGE SET

  	 Revision  by hverkuil: (media: av7110: remove old documentation files)

	 change: delete drivers/staging/media/av7110/video-continue.rst

	 change: delete drivers/staging/media/av7110/video-get-pts.rst

	 change: delete drivers/staging/media/av7110/audio-set-mixer.rst

	 change: delete drivers/staging/media/av7110/video-get-capabilities.rst

	 change: delete drivers/staging/media/av7110/video-fast-forward.rst

	 change: delete drivers/staging/media/av7110/audio-fclose.rst

	 change: delete drivers/staging/media/av7110/audio-get-capabilities.rst

	 change: delete drivers/staging/media/av7110/video-set-display-format.rst

	 change: delete drivers/staging/media/av7110/audio-bilingual-channel-select.rst

	 change: delete drivers/staging/media/av7110/audio_data_types.rst

	 change: delete drivers/staging/media/av7110/video-fclose.rst

	 change: delete drivers/staging/media/av7110/audio-set-bypass-mode.rst

	 change: delete drivers/staging/media/av7110/video-slowmotion.rst

	 change: delete drivers/staging/media/av7110/video-get-size.rst

	 change: delete drivers/staging/media/av7110/video-try-command.rst

	 change: delete drivers/staging/media/av7110/audio-stop.rst

	 change: delete drivers/staging/media/av7110/video-command.rst

	 change: delete drivers/staging/media/av7110/video_function_calls.rst

	 change: delete drivers/staging/media/av7110/video.rst

	 change: delete drivers/staging/media/av7110/audio-get-status.rst

	 change: delete drivers/staging/media/av7110/audio-select-source.rst

	 change: delete drivers/staging/media/av7110/audio-set-streamtype.rst

	 change: delete drivers/staging/media/av7110/audio-fwrite.rst

	 change: delete drivers/staging/media/av7110/video-get-event.rst

	 change: delete drivers/staging/media/av7110/video-select-source.rst

	 change: delete drivers/staging/media/av7110/audio-set-id.rst

	 change: delete drivers/staging/media/av7110/audio-set-mute.rst

	 change: delete drivers/staging/media/av7110/video-play.rst

	 change: delete drivers/staging/media/av7110/video-set-format.rst

	 change: delete drivers/staging/media/av7110/video-set-streamtype.rst

	 change: delete drivers/staging/media/av7110/video_types.rst

	 change: delete drivers/staging/media/av7110/audio-continue.rst

	 change: delete drivers/staging/media/av7110/TODO

	 change: delete drivers/staging/media/av7110/video-get-status.rst

	 change: delete drivers/staging/media/av7110/video-clear-buffer.rst

	 change: delete drivers/staging/media/av7110/audio-clear-buffer.rst

	 change: delete drivers/staging/media/av7110/audio-set-av-sync.rst

	 change: delete drivers/staging/media/av7110/audio-channel-select.rst

	 change: delete drivers/staging/media/av7110/video-freeze.rst

	 change: delete drivers/staging/media/av7110/audio.rst

	 change: delete drivers/staging/media/av7110/audio-play.rst

	 change: delete drivers/staging/media/av7110/video-set-blank.rst

	 change: delete drivers/staging/media/av7110/audio-fopen.rst

	 change: delete drivers/staging/media/av7110/video-stop.rst

	 change: delete drivers/staging/media/av7110/video-fwrite.rst

	 change: delete drivers/staging/media/av7110/video-stillpicture.rst

	 change: delete drivers/staging/media/av7110/video-fopen.rst

	 change: delete drivers/staging/media/av7110/video-get-frame-count.rst

	 change: delete drivers/staging/media/av7110/audio-pause.rst

	 change: delete drivers/staging/media/av7110/audio_function_calls.rst

  	 Revision  by hverkuil: (media: av7110: remove budget-patch driver)

	 change: edit drivers/staging/media/av7110/Makefile

	 change: edit drivers/staging/media/av7110/Kconfig

	 change: delete drivers/staging/media/av7110/budget-patch.c

  	 Revision  by hverkuil: (media: sp8870: coding style fixes: whitespace)

	 change: edit drivers/staging/media/av7110/sp8870.h

	 change: edit drivers/staging/media/av7110/sp8870.c

  	 Revision  by hverkuil: (media: sp8870: coding style fixes: newline, comments and braces)

	 change: edit drivers/staging/media/av7110/sp8870.h

	 change: edit drivers/staging/media/av7110/sp8870.c

  	 Revision  by hverkuil: (media: sp8870: coding style fixes: miscellaneous)

	 change: edit drivers/staging/media/av7110/sp8870.c

	 change: edit drivers/staging/media/av7110/sp8870.h

  	 Revision  by hverkuil: (media: sp8870: coding style fixes: logging)

	 change: edit drivers/staging/media/av7110/sp8870.h

	 change: edit drivers/staging/media/av7110/sp8870.c

  	 Revision  by hverkuil: (media: av7110: coding style fixes: pointer_location)

	 change: edit drivers/staging/media/av7110/av7110_v4l.c

	 change: edit drivers/staging/media/av7110/av7110_ca.c

	 change: edit drivers/staging/media/av7110/av7110.h

	 change: edit drivers/staging/media/av7110/av7110.c

	 change: edit drivers/staging/media/av7110/av7110_hw.c

  	 Revision  by hverkuil: (media: av7110: coding style fixes: blank lines)

	 change: edit drivers/staging/media/av7110/av7110.h

	 change: edit drivers/staging/media/av7110/av7110_av.h

	 change: edit drivers/staging/media/av7110/dvb_filter.h

	 change: edit drivers/staging/media/av7110/av7110_ipack.c

	 change: edit drivers/staging/media/av7110/av7110_v4l.c

	 change: edit drivers/staging/media/av7110/av7110_av.c

	 change: edit drivers/staging/media/av7110/av7110_hw.c

	 change: edit drivers/staging/media/av7110/av7110.c

	 change: edit drivers/staging/media/av7110/av7110_ca.c

	 change: edit drivers/staging/media/av7110/av7110_hw.h

  	 Revision  by hverkuil: (media: av7110: coding style fixes: whitespace)

	 change: edit drivers/staging/media/av7110/av7110_ipack.c

	 change: edit drivers/staging/media/av7110/av7110_v4l.c

	 change: edit drivers/staging/media/av7110/av7110.c

	 change: edit drivers/staging/media/av7110/av7110_ca.c

	 change: edit drivers/staging/media/av7110/av7110_hw.h

	 change: edit drivers/staging/media/av7110/dvb_filter.c

	 change: edit drivers/staging/media/av7110/dvb_filter.h

	 change: edit drivers/staging/media/av7110/av7110_av.c

	 change: edit drivers/staging/media/av7110/av7110_hw.c

  	 Revision  by hverkuil: (media: av7110: coding style fixes: newline)

	 change: edit drivers/staging/media/av7110/av7110_hw.h

	 change: edit drivers/staging/media/av7110/av7110.c

	 change: edit drivers/staging/media/av7110/av7110_ipack.c

	 change: edit drivers/staging/media/av7110/av7110_v4l.c

	 change: edit drivers/staging/media/av7110/dvb_filter.c

	 change: edit drivers/staging/media/av7110/av7110_hw.c

	 change: edit drivers/staging/media/av7110/av7110_av.c

  	 Revision  by hverkuil: (media: av7110: coding style fixes: whitespace (strict))

	 change: edit drivers/staging/media/av7110/av7110_hw.h

	 change: edit drivers/staging/media/av7110/av7110.c

	 change: edit drivers/staging/media/av7110/av7110_v4l.c

	 change: edit drivers/staging/media/av7110/av7110.h

	 change: edit drivers/staging/media/av7110/dvb_filter.c

	 change: edit drivers/staging/media/av7110/av7110_av.c

	 change: edit drivers/staging/media/av7110/av7110_ca.c

	 change: edit drivers/staging/media/av7110/av7110_av.h

	 change: edit drivers/staging/media/av7110/av7110_hw.c

	 change: edit drivers/staging/media/av7110/av7110_ipack.c

	 change: edit drivers/staging/media/av7110/dvb_filter.h

  	 Revision  by hverkuil: (media: av7110: coding style fixes: comments)

	 change: edit drivers/staging/media/av7110/av7110_av.c

	 change: edit drivers/staging/media/av7110/av7110_hw.h

	 change: edit drivers/staging/media/av7110/av7110_v4l.c

	 change: edit drivers/staging/media/av7110/dvb_filter.h

	 change: edit drivers/staging/media/av7110/av7110_hw.c

	 change: edit drivers/staging/media/av7110/av7110.c

	 change: edit drivers/staging/media/av7110/av7110_ca.c

  	 Revision  by hverkuil: (media: av7110: coding style fixes: braces)

	 change: edit drivers/staging/media/av7110/av7110.c

	 change: edit drivers/staging/media/av7110/av7110_ipack.c

	 change: edit drivers/staging/media/av7110/av7110_av.c

	 change: edit drivers/staging/media/av7110/dvb_filter.c

	 change: edit drivers/staging/media/av7110/av7110_hw.c

	 change: edit drivers/staging/media/av7110/av7110_v4l.c

  	 Revision  by hverkuil: (media: av7110: coding style fixes: assignments)

	 change: edit drivers/staging/media/av7110/av7110.c

	 change: edit drivers/staging/media/av7110/av7110_av.c

	 change: edit drivers/staging/media/av7110/av7110_ipack.c

	 change: edit drivers/staging/media/av7110/dvb_filter.c

	 change: edit drivers/staging/media/av7110/av7110_hw.c

  	 Revision  by hverkuil: (media: av7110: coding style fixes: comparsations)

	 change: edit drivers/staging/media/av7110/av7110_v4l.c

	 change: edit drivers/staging/media/av7110/av7110.c

	 change: edit drivers/staging/media/av7110/av7110_hw.c

  	 Revision  by hverkuil: (media: av7110: coding style fixes: sizeof)

	 change: edit drivers/staging/media/av7110/av7110_v4l.c

	 change: edit drivers/staging/media/av7110/av7110.c

  	 Revision  by hverkuil: (media: av7110: coding style fixes: variable types)

	 change: edit drivers/staging/media/av7110/av7110_av.h

	 change: edit drivers/staging/media/av7110/av7110.c

	 change: edit drivers/staging/media/av7110/av7110.h

	 change: edit drivers/staging/media/av7110/av7110_av.c

  	 Revision  by hverkuil: (media: av7110: coding style fixes: miscellaneous)

	 change: edit drivers/staging/media/av7110/av7110_ipack.c

	 change: edit drivers/staging/media/av7110/av7110.c

  	 Revision  by hverkuil: (media: av7110: coding style fixes: deep_indentation)

	 change: edit drivers/staging/media/av7110/av7110_ipack.c

  	 Revision  by hverkuil: (media: av7110: coding style fixes: logging)

	 change: edit drivers/staging/media/av7110/av7110.c

	 change: edit drivers/staging/media/av7110/av7110_av.c

	 change: edit drivers/staging/media/av7110/av7110_hw.c

	 change: edit drivers/staging/media/av7110/av7110_ir.c

	 change: edit drivers/staging/media/av7110/av7110_ca.c

	 change: edit drivers/staging/media/av7110/av7110_v4l.c

	 change: edit drivers/staging/media/av7110/dvb_filter.c

	 change: edit drivers/staging/media/av7110/av7110.h

  	 Revision  by hverkuil: (media: av7110: coding style fixes: avoid_externs)

	 change: edit drivers/staging/media/av7110/av7110_av.h

	 change: edit drivers/staging/media/av7110/av7110_ipack.h

	 change: edit drivers/staging/media/av7110/av7110.h

	 change: edit drivers/staging/media/av7110/av7110_ca.h

	 change: edit drivers/staging/media/av7110/av7110_hw.h
------=_Part_3_1064223398.1717512419728--

