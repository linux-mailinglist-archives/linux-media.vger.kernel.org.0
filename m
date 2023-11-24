Return-Path: <linux-media+bounces-974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3C57F72A3
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 12:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 723C01C20CEB
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 11:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A781D68F;
	Fri, 24 Nov 2023 11:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="bdT73Uya"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AE910EB;
	Fri, 24 Nov 2023 03:24:29 -0800 (PST)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4ScCLK45YLzySy;
	Fri, 24 Nov 2023 13:24:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1700825066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4HYZA0J4KQ7QUzTmkn08hgDrWms9zYebzose47qF6ys=;
	b=bdT73UyaM43US7lT95gmMyRSURsEo0y0B/VDZdb3FRFSIylAxTdbAbSlmUBiFkhcF85V8u
	b4wwWm0cRw76HJCAUMlAwm7d5Xxg/ciIZkHKLakqt8Otw+Zk9VIyPonLmzHPEpnl6yYTPs
	mCaPqH1Q7DKppHdQ3HLkm8KuxGDmKcA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1700825066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4HYZA0J4KQ7QUzTmkn08hgDrWms9zYebzose47qF6ys=;
	b=gt81+2kmTfRWj89+d+m/yqW+5yosKPG8/aja5RYkdcJQD6KhWORNZoiBCyCDif4yGMVrYw
	MxgXrEJMZfaJ52QrA0UGbF1ORIdrSHldP3qu2zfNVBWW+WZv/TtNweBt1FuLwYUG+skj9i
	89mFhpdQW4XWAn3CIlNQUKpLHwvvUKc=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1700825066; a=rsa-sha256; cv=none;
	b=bzLKCnugxYFOsFYYMdKfaUnzxlQboycZqzFZDwedICvgAF+AxTukH+Dcz3ufqGiSnU00B1
	I7OqWxkqUGAq23lrj73bTLDo/jl2irxfgN82ObKLfksLka1DeAc5mSmf5p11rHL5b7WLk2
	+ks8c1qZz9RG8H8UlREkpFXkf9Xec8Y=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4CE50634C93;
	Fri, 24 Nov 2023 13:24:21 +0200 (EET)
Date: Fri, 24 Nov 2023 11:24:21 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sebastian Reichel <sre@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] GC0308 Camera Sensor
Message-ID: <ZWCH5cT51XGky6d9@valkosipuli.retiisi.eu>
References: <20231113230421.226808-1-sre@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113230421.226808-1-sre@kernel.org>

Hi Sebastian,

On Mon, Nov 13, 2023 at 11:57:19PM +0100, Sebastian Reichel wrote:
> Hi,
> 
> I did the following tests on an i.MX6ULL based system [0]:
> 
>  * v4l2-compliance -u /dev/v4l-subdev1
>    - v4l2-compliance 1.24.1, 32 bits, 32-bit time_t
>      (from Debian testing)
>    - Total for device /dev/v4l-subdev1: 44, Succeeded: 44
>  * Using gstreamer + v4l2-ctl
>    - Tried 640x480, 320x240, 160x120 YUYV8_2X8 formats
>    - Tested effect of all exposed user controls
>  * checkpatch does not report any driver issues
>  * dt_binding_check does not report anything
>  * rebinding driver works

I forgot to ask this earlier --- the sub-device state information access
functions have been reworked and that resulted in renaming the functions
this driver uses. Could you rebase this on the current stage tree?

The commit doing this for all merged drivers was
bc0e8d91feec72b19199298dca470c5816a52105 .

Could you also add Cc: stable for the v4l2-async list fix?

Thanks.

-- 
Kind regards,

Sakari Ailus

