Return-Path: <linux-media+bounces-7687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 289DE887C9F
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 13:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A2611C20DBA
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 12:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8CB179A8;
	Sun, 24 Mar 2024 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="BREijARD";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="UBYH/B/g"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4BD17741
	for <linux-media@vger.kernel.org>; Sun, 24 Mar 2024 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711281873; cv=pass; b=aCqYrooJ/aVwMRbBJgZf81Kqvpq+9O+frGPchsfwD3hfislPCd/LJ6A76JkZ2jzOegSH2yieH3RcWNzAQUaIDKVV39bzxPVVBMIwiyPc3sIwIX/rfq7OfLlF+EuaFHkLMHb55pJ7aEF4GNut/Bs7+AE5BmCEeSGpuHepbnsaGIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711281873; c=relaxed/simple;
	bh=NoLbTFf2XGIMEZnxbRkcIyhYy9UTkRYy4XTagDKAnME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJjm8alqSoUkvZN+hZVuIKNoFMWVu4qvG0771ILnFDsZ8LwvbMjGOUJHXzjexrPtu5PCOqFycjdASNE+68/w3f7vishnNyD9twi+CT/CPkvps/IROOrD/Q0Hz5w2Ng6VPHpokT3r6tQt5PcGEJDVk6vVZc+sbWMusgJH6t21g1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=BREijARD; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=UBYH/B/g; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4V2ZVY1D8Qz49Pyr
	for <linux-media@vger.kernel.org>; Sun, 24 Mar 2024 14:04:21 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1711281861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TfhYvG2nBjyumVg8jsjuFpBF21kLW9i5xpmKxEtCNwU=;
	b=BREijARD9kFQlTTUDp6EDQtcOcdStTSzpbO9udN5vK38V36WlC7v8E0yscLFWts/SQaq+6
	cDKMqR1i9eN4VBv8IWzDQIeg03oI+eNOdRaxwcWK5csbkuUAWkSPvNpNWBDDlvE4lMXNDG
	AJ+XUmWFrFlXexV6cFkgQ5bultJCz0X/c+6tzV9453daQhZbv4ivQt+lvShl4fc5sHZRhr
	9AU8Rs3Y3ZMdP4j3LYTMHNeIRgTX8wSEvoB2HDDBkfh9KNEZ7eN9iX1HTmpEgVx1uN5bzo
	D/IyploOWVPlIk/ZL9A6mOAKHb2hUTpvSUXufh6xDMVVx5IPSyZUX27WQ3P/Zw==
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4V2ZVN68DqzySG
	for <linux-media@vger.kernel.org>; Sun, 24 Mar 2024 14:04:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1711281852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TfhYvG2nBjyumVg8jsjuFpBF21kLW9i5xpmKxEtCNwU=;
	b=UBYH/B/ggUD1Ix49Zu+MjtgYda820lq6VoMZoJkGjQGgeX0I4nw0DPBdi99M3Vb3dZm+fo
	lkuLzcye8+zA9QHZO4L4Grr4s7UwuuGTuPawSA7nB0uJkG9bCDLUucD0gsk2kF8M/8h6Lg
	vTxS80VaLsNeZWkJqnFIMdFLApYyUd4=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1711281852; a=rsa-sha256; cv=none;
	b=IJvbWsti1z7J+hwvpbvlUT+wtyeDd8WvoOty+52ca/x4QkQEYdoedgno1lx6c/+pyZOAk7
	43sN9Gj5yXmrPEhDxFvIfJwjW4VuOHTc6046qxrVOmmzMn/jeuG0NSyt+F+gJKxvtU1f4V
	urLtLkRoxhbGX45rO52CDB+q3tiuQ2M=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1711281852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TfhYvG2nBjyumVg8jsjuFpBF21kLW9i5xpmKxEtCNwU=;
	b=xFxdvv0s5cTi5HtIBqmktlDjg6SQFpwXOV1qhhl8Niw7HcipmyX8ov9Ui+DGqhHu9Uj6a3
	rZuFybclog7b2/CkUPLe5BIHwy5QPepMP4oMz0cO963uQqr9WnYL6ZVKZ4oTWj3hcoEwSH
	DrQbErq/wxp8vJAPSFkDYj9omTleE7o=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4355A634C93;
	Sun, 24 Mar 2024 14:04:12 +0200 (EET)
Date: Sun, 24 Mar 2024 12:04:11 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [raw2rgbpnm] [PATCH 2/2] Add YUVA32 and YUVX32 4:4:4 packed
 pixel formats support
Message-ID: <ZgAWu9HAfcJ1oe9s@valkosipuli.retiisi.eu>
References: <20240324004447.3399-1-laurent.pinchart@ideasonboard.com>
 <20240324004447.3399-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240324004447.3399-2-laurent.pinchart@ideasonboard.com>

On Sun, Mar 24, 2024 at 02:44:40AM +0200, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> The YUVA32 and YUVX32 formats are permutations of other YUV 4:4:4 packed
> pixel formats. Support them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks, I've applied both!

-- 
Sakari Ailus

