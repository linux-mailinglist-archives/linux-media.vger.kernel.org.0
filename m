Return-Path: <linux-media+bounces-3791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFFB830486
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 12:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16CB12882DF
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 11:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9671DDF1;
	Wed, 17 Jan 2024 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="v4WU4mh7"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7751DFC3
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 11:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705490898; cv=pass; b=jn4IVhXLhztL5LGQaexSDZXi8tzZf4E1x3lrLWbUH/d1M/l6SvLOxapUL/EHxw0lxrf+AKhRBQJYzZ4XBkzmM+SH0z995lyyJ4QInqQ7WcKTK4Qai3N0zvs90DZfIXWd81hF7hfs2pO8aFRtRxv4Il9xZrp90Ol475a9SvERGZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705490898; c=relaxed/simple;
	bh=kEpN6JTpYdTXq/BqP4dFiTBwSkzDJWS2B/N9X6O7Dbg=;
	h=Received:DKIM-Signature:ARC-Message-Signature:
	 ARC-Authentication-Results:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=On+kRjm+YUSf6HQxRT0+wT5ASZ3tgO7uV+LfXBBJU/9w2fCx0cDzjxJ25VLY+jpK5iYC1bdhgnRbDHwguwpG3wm6td1+LbSvNw3on4p7w3vTI3cYXmLy1p+6NA6gwA/m+jIInezgC4osZ0JquR2DJcQU4RpNUHxkCkErXBsrfc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=v4WU4mh7; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TFNsc6sffzyVR;
	Wed, 17 Jan 2024 13:28:04 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1705490887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NqK3AqB2oVPt/kCj4abLnqfQRodTmL0pmmJ9znFPePE=;
	b=v4WU4mh7Sk4MLks0pYAY2727j6k7GCq+OSH5IFprdS2VCt4V3AfwB0e77VokW9yHqucCbv
	aS9Rm7KF6/pif5UQd6q5auY9xC+yQ6ApoUlLvaQ74eKFKyrCm1GKMG+OFQel/g+ujiCYk2
	9GsUC7mRRxZ21PO0i3UAXbgHAccfUZo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1705490887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NqK3AqB2oVPt/kCj4abLnqfQRodTmL0pmmJ9znFPePE=;
	b=PivjaQeURrFDtungsNCXMkC0JZYomnuKdO57IXilBlofEtAi8fVBvbIlSSx15SP8zc1wh7
	Lm7xiIIbVnjT+eEya9IVTE2H+VQKZ/DdV5lvBPfplnH5PB/wIm1Bpu4ClyqOcrDt7DOOAw
	ZhrhiNLGMXVlPsj/QnJVQFl59HI20c0=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1705490887; a=rsa-sha256; cv=none;
	b=QWa9L5Hd2Zy7OqRmlZ1y3ghI7bQr2hu7RElznfHJiRkckpd+oxr0krARnLaD9qpStIerRx
	42sMyzRhgeJEsN7YyZ9hQd2nQXzZ+rtCbIFk3aJP0sEnLNNFNZI+LGx89ZY2rFUbUhvFaI
	e5Sqg1kcF3Ce/cEZupZ7S5lKN3//jFg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6E1C9634C93;
	Wed, 17 Jan 2024 13:28:03 +0200 (EET)
Date: Wed, 17 Jan 2024 11:28:03 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH v3 1/1] media: tc358743: register v4l2 async device only
 after successful setup
Message-ID: <Zae5w_JbrLXikmTo@valkosipuli.retiisi.eu>
References: <20240110090111.458115-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110090111.458115-1-alexander.stein@ew.tq-group.com>

Hi Alexander,

On Wed, Jan 10, 2024 at 10:01:11AM +0100, Alexander Stein wrote:
> Ensure the device has been setup correctly before registering the v4l2
> async device, thus allowing userspace to access.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Robert Foss <rfoss@kernel.org>

This should be backported to the stable trees. I'll add Cc: stable.

The patch seems to co-incidentally fix error handling, too. :-)

-- 
Regards,

Sakari Ailus

