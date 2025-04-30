Return-Path: <linux-media+bounces-31392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54497AA45D3
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE1F89C2A23
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9EB21ADB7;
	Wed, 30 Apr 2025 08:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="pLmvk3hT"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295C1DF75B;
	Wed, 30 Apr 2025 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002725; cv=pass; b=S65JF6U25jkJtcFiBoKoB/67ARduCvku/d5gEyCsvP+mYkm63d0uOkdrqoMQ+gmTt96miowuNeJMytAn0AAhKD+8q5dw2cVParGh7hp+vCJN8vDJ3+040NvQrU142xJr+e0xAHKzM29YhnyI2/NXETYzlbKPuKFN1KhqR9TJUO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002725; c=relaxed/simple;
	bh=zwv4aRUkhROjLxUyP2QXYbMC+L8yYlnZn9I5vh/u4Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPK0JoLHQOoDlC63WfyF1h6W9e/RDaGsouH/sXGITgrrOZ5IfeKy3SGYAcnVEImFW0YJHYDbd1J959S9LzaCQjiRO53b9T5dHYVaJMEvpsiudKy9VV7N5EOFQQ9zdrFZwW+7ADhZ/0VGOi0lJF2db0p7iDZrwCHDQW3kZTEf2+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=pLmvk3hT; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4ZnW3B2pdbz49Pyt;
	Wed, 30 Apr 2025 11:45:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1746002710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gxo87qhiPDE/HYyG5N8ospvrvESDKBZQSB5z9WkZIHw=;
	b=pLmvk3hTwJde5T9JBmFfVRNqz9lTwfeWTql71/gnmsFliPnMlnaPlu7A711fiaXXO+Jh1k
	qnGg9z6ar/TM2rD39d0662xHMba51Yd0bsD8VEEeFG2OjUDscMVdOnlxcza1xwHedos6LL
	JyycBkFhSGjwERSIcGiojvZbvEpFXap3w5VPjMV9FBBdGkvYNH1fPiB9qgagXm+Pw90tE0
	qF2jvBKmZt/u4CyuTVKPUk1rQwKIQI68enE3AHd4dkmmc131oX1dIMSFiuRhwRLRShZGyY
	VCFyRJ8frdeRQRawllMNoRQhvT8IphlcDHSTJBusRBToxaqA4Qdb/LQ2HxlrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1746002710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gxo87qhiPDE/HYyG5N8ospvrvESDKBZQSB5z9WkZIHw=;
	b=gHGBHyiJSEdNokfxvw2y0OWsI5UXYDvt30H/Sidy7EzKt3eR6noGx2QehmpLZloqCl7xqU
	VBIwdh4SsQvv+myal7nhfJehoE1H7lRVIkW4R72/34tV1BF+pYHss32PaPfKNx5prNzpjw
	hxdMlvV0InThax+qokPmUcinBwP7hObRNlz8DsUxX/rVENw4aUWXJcZxWIARoLLsoKN5Kn
	rWeWyUOAC2dp0XvDljg4s+V7QBm4KQmvYFE6qSvsBXIqdJwf/ymFzV2CzGakpO2yGSomOV
	HMOWndNR8Icr2wJ2xZNwPTvv8mPvseUhw2CAxbPUt6ZTg62RgN4veV3g35Uogg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1746002710; a=rsa-sha256;
	cv=none;
	b=LEskwEHNtyE+Xsqee1tm/WG+pnRkomsryvm5n56Ud3Qb3kj6d6aRK9+M0QtRkQYAGpXBFm
	wDt9cjsUeuwDG64zOkubLmmlR74wtuHlQogq0jAvgXOOQADaYAki9PPc4UG2ZoyEDXtfiF
	ooyDfvLkh8/SqZSpfOd1DJrvPbVsvPscw4bMEYl21FNfEDrYGO/iSkkueMKZmmQyL/exHs
	n7K7b7na5aM7waspoNGcHOmu22t2t1v0zCnFJIe83WKVMthlkVjfgH7zbFKd0AZwS7JbN2
	YL7SCs2obAEbCtKgSADMVb0jgAwPYCBS7zXa4JP3A+jw+PJbkFcLJjWYpvETUQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E898C634C93;
	Wed, 30 Apr 2025 11:45:09 +0300 (EEST)
Date: Wed, 30 Apr 2025 08:45:09 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: media: i2c: imx335: Fix frame size enumeration
Message-ID: <aBHjFcbjR_oPiINu@valkosipuli.retiisi.eu>
References: <20250430073649.1986018-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430073649.1986018-1-kieran.bingham@ideasonboard.com>

Hi Kieran,

On Wed, Apr 30, 2025 at 08:36:49AM +0100, Kieran Bingham wrote:
> In commit cfa49ff0558a ("media: i2c: imx335: Support 2592x1940 10-bit
> mode") the IMX335 driver was extended to support multiple output
> bitdepth modes.
> 
> This incorrectly extended the frame size enumeration to check against
> the supported mbus_codes array instead of the supported mode/frame
> array. This has the unwanted side effect of reporting the currently
> supported frame size 2592x1944 three times.
> 
> Fix the check accordingly to report a frame size for each supported
> size, which is presently only a single entry.
> 
> Fixes: cfa49ff0558a ("media: i2c: imx335: Support 2592x1940 10-bit mode")
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Thanks for the patch.

Cc: stable is required these days with Fixes: tag, I've added it this time.

-- 
Sakari Ailus

