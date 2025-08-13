Return-Path: <linux-media+bounces-39803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E63B24869
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 13:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCF5A4E1C23
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436A82F6596;
	Wed, 13 Aug 2025 11:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFoGOVkC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6A82F0693
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755084227; cv=none; b=GUkc+jZ9KqvW8xESUF1PzYlB3BAHQ3Q2DYDoL5mSOW0nGoRsRdP8m+jOVvLORODjQEIJD67l+xtXLsf6LnWuXMTWZT4TsidRGc4lOc+h3HVUHIbusWZ8dEin05kv6alSA0S0VMqSCys3bZDCn1snhHSyk4LvRRk38ugndEx1xSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755084227; c=relaxed/simple;
	bh=F6iNjiybXN5jpIdLHNT7Kv1VWLq9o4UbAXi7u0ZBlRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETfGBRw0a/jFJNEaSIXPgiOHfnOYlvQ3rhaQ+iO1yTWtyYTCEy1bXjpY3qLShd2dUHYyoV0rlFGO5g0JuNeXXKriSIlKFTeABRXTbuwaJN1fH0nwt4Gf5sLmu5mE9kXck3UknzMslwHq0UQFJilNXXO2l3hHLWuzUcQMxQNc2qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFoGOVkC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55b9a23d633so961818e87.1
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755084224; x=1755689024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6iNjiybXN5jpIdLHNT7Kv1VWLq9o4UbAXi7u0ZBlRk=;
        b=lFoGOVkCv3dPc9Vi/KnkVgb/qh5KiGurJSb/yfk7lpQ1LLA61Fp0k9FFyEV+jxNjDt
         JGM7K18fcYzNa6m74S14v36vOxwlhS538JlxlEYvLfgZAMeRZtTGEwaJz8GzL3F0P4Uc
         ys2KSeWXTim6rhG8pZkaUE1/kfn1hq6F/yOL8dHbSLpDc0HsltluxPobitZrS5N+pqrZ
         Eypv/sdma+wwE6k5OfI19m+Sl4UOmDqlcOy/pEl0RNdzll4gF0WoDKhE5MDvNFZAXT/n
         D/GvIwLwVdqdCHqRoMJ5SleULVj4N2/4hsXruL4ljiSjXkyBcMMuSbz4KwApl1+o3hE1
         J1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755084224; x=1755689024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6iNjiybXN5jpIdLHNT7Kv1VWLq9o4UbAXi7u0ZBlRk=;
        b=oe40NUCpReBdjrO1ccd+U/bVU4ZSaSMFgJdtP2eKkl0XGV1JdI+AiA2GGS5XcdW6Xp
         pSa6PY1Z28kDbg4fesZn7x6ohEdGwRUlIXmIwn88aaGbS/cRc8dpqUIIujU88lJCAvhU
         +pQFwPjqW+eqQdg5maQ7rAyw/5SioTwaZHX6c0IFzH2nyuVPjp3vqH6UMIKZ4nPvtkez
         1mHQDp57MKe2d4bNAVwbuh5b9Y4qdZB7/BH+gQin4yMQSrU+UYEaRoNtIpmBW9eHt6qw
         6f9jdFhUoadRs+xiuG0fKEBZKojoqN39+Is3LXSsWcSLv6iyVLVvW+ZkFJHIsGMw7iqD
         KGlA==
X-Forwarded-Encrypted: i=1; AJvYcCVBEwfCEirEzTxrS5pM7S2com75+XJQmtAss5UQBCP65rnDyigwufily173usI1nKVAR/FpdRv1UlaYBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3vxsg7X7sZwcwJFh0dl8vXJxGzMoXDM207kfnqVkezoGNHboy
	7wQWgZqIj6WEwgwlrv+ioyb959uptAEBq/ftfe7IB7FetKdZKq6FbGxFUk9pl6PGn5oJWmZr0Br
	jzbo7AhG2CyIu7/5OxjAe3Mfn4JFxatU=
X-Gm-Gg: ASbGncsu641uCZIheyWExa22JoKATYUmgfbWAh7dURHgyTpGAhbzjKZAjb0DZifvBAW
	YQWyJN0+F/NrxNI1NDz0xweJEoooH+7hI3bU7l5FMcw0vfow6wiIGlwyI46Ny4h7V4gHIt3GIdx
	iVeofgK7j8UO76kdXb3OFLa9BuuA2f+3W/d+B1xE9yeH38myFbV59EDuJKujIFoaffh+6TCWQC8
	mwV3sd5CVzotCAKOSCO
X-Google-Smtp-Source: AGHT+IFZaPNI23uD5KHPb/dAWadx5ONVsp4l8t3fYZlqnhk0xz2AahKAWju7F0kIKbXo7NQu56Q6kUJjybCLGKZeFW8=
X-Received: by 2002:a05:6512:1149:b0:550:e8b6:6996 with SMTP id
 2adb3069b0e04-55ce13f7406mr603858e87.2.1755084224054; Wed, 13 Aug 2025
 04:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com>
In-Reply-To: <1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Aug 2025 08:23:32 -0300
X-Gm-Features: Ac12FXxkf0FpQ3-QCxYS4XbBrV3yz9dhb7qIwsnTTE1WBvlxo9QXP7ql1oRWXhE
Message-ID: <CAOMZO5C3o+UaLRaXfB+sfmgB801mNTLztE_cy-e5duKDAL-1Hg@mail.gmail.com>
Subject: Re: Kernel Panic when trying to capture camera with ffmpeg on imx8mp
To: Maud Spierings <maudspierings@gocontroll.com>, Tim Harvey <tharvey@gateworks.com>
Cc: Laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-media@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maud,

[Adding Tim]

On Wed, Aug 13, 2025 at 8:12=E2=80=AFAM Maud Spierings
<maudspierings@gocontroll.com> wrote:

> My devicetree setup is practically identical to the one in
> freescale/imx8mp-venice-gw74xx-imx219.dtso (different i2c bus and
> regulator gpio only)

You'll need to configure the camera pipeline using media-ctl commands.

Take a look at:
https://trac.gateworks.com/wiki/venice/multimedia#MediaControllerPipeline

