Return-Path: <linux-media+bounces-8679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B99898F59
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 22:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B815F1C23302
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 20:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201D1134733;
	Thu,  4 Apr 2024 20:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="ZbngQNR9"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AA16D1AB
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 20:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712261032; cv=pass; b=JenmHVN4G7FFkXmkvfwTRm/izN+kXQyFnmeyAGnx24snvju0tjIsunfNt3yF+9MUp5f5hVSe6i/CgejTuPcpwAZh7X4N45WGKVKl6Px2kmTg1fWpKJAYyGAzCfswOVXwwsP3MT98uJxCHY8UooEi20NXyLui7x8Uh7257zC/rwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712261032; c=relaxed/simple;
	bh=9zCFxmlkcJ7sk3w5GGK7xQKNGVnQ4aT0oWrjuk6xRts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdxBTNpund6gZCCi8rNf02iQzIKAr+0Ru5MXdv7oPoMrJQbv/uUBOvtpYPQvV0VaUewpdnqHKiixusmUh6eajF1DWE+lba3kfr/duV4UKEXm/TkOu5pNcrq4/Ft0uiPBEo0IgMdJzvqtA328prUNCUPj+H+1nuesYwRTiOQWNoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=ZbngQNR9; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4V9XcX1FWdzyNX;
	Thu,  4 Apr 2024 23:03:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1712261021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PMLvjOuCt1/1txqYjbtsO9uhwTAn/6CNFj8EVq/qAEc=;
	b=ZbngQNR9zsipVmj6pKET8OQZU1zM5EKB5B2h1xB1sWzFmiPPeP2Gcm8N3cc2Ykfj/KpqZ/
	cCvjLG7Dy/vYwHWekCXYJPU8rvCvrAum4/3RY5ZOS/pR3bGBI7qHOI/OoLqkVbL7nJfL8E
	3EBE9CKpaiqKEgegXFMGDbGpwayjPqI=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1712261021; a=rsa-sha256; cv=none;
	b=ZR3lDFaXfEMP4Ehu75fN6OPscUAm4ZzGb4vdmWgfkWDr5Z1AnqZaOPhIOk4b29ruOJv61b
	D1qcUZ85S7CFz5qOEcaW/kfN1wkYg3Hu0s6AKIoAi/0z/V23FiMCiRggbMVeOTLAbLH2Xs
	XRnLO1sIZHlMPp//+CkAQmqgiaUL+H8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1712261021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PMLvjOuCt1/1txqYjbtsO9uhwTAn/6CNFj8EVq/qAEc=;
	b=VSPIZmOWM6HXrY/Z+1SlAu72fFzgNSStohi1ZsE/5idRDIDDzyCXH8/iv1/obfYaoJbgL2
	5g3+EMzR/wjnILcJzKnlQSRkqVBkl0P9XuifLrBfllRC9f7qcPz8uvAxnxEwAniaPqZd/A
	XfdGaAl9+E5DTUp7j6bSv6coBinHp0U=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EAD74634C93;
	Thu,  4 Apr 2024 23:03:38 +0300 (EEST)
Date: Thu, 4 Apr 2024 20:03:38 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: Re: [v4l-utils] [PATCH 1/2] utils: libv4l2subdev: Drop stream
 support for the crop API
Message-ID: <Zg8HmvykGpVCXFRD@valkosipuli.retiisi.eu>
References: <20240403232425.22304-1-laurent.pinchart@ideasonboard.com>
 <20240403232425.22304-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403232425.22304-2-laurent.pinchart@ideasonboard.com>

On Thu, Apr 04, 2024 at 02:24:24AM +0300, Laurent Pinchart wrote:
> The subdev crop API has never had working streams support in the kernel.
> The stream field of the v4l2_subdev_crop structure will be removed,
> prepare for that by not setting it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

