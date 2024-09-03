Return-Path: <linux-media+bounces-17471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB1969D5F
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 14:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81FE81F23A66
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 12:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFA71C9857;
	Tue,  3 Sep 2024 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ppjj+cC0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6E51B12F6
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 12:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725366071; cv=none; b=aZNR9MuItv+8VgyQqGMa8/L7pAvm+EkMWfgZ2VWc63JFf5sgFC6TacB4LmX5QeOjcWbVTGHKfaTYuFq7R+hrwV/diJ80Mvhn6zFowdObuT2LFosPNPpZXSpMqIyMsOqFplzpgn5YtLE5dC1fPsEDD5VKt2iXdxgYY8XwCpSlFlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725366071; c=relaxed/simple;
	bh=M+1eMu36ZFzjE8m4MylaGnyG/DJD4w8EeqQ7v4hF5uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlfWBxs2mWoH3w7x1xLBMQ97zy8/b9grTwShFO4Oaoed8cdlwlmwHw42DE9AOCPeMF6vUtIZuo2fhB2V1Tdrduu34CfAPr0/TRbmcwB4HFzQ8saux+xQjWEC+27o/C11BNRfNgAB9c7+HQHBu9NP+Dt3/ZIaKucZPaMQz/uqHFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ppjj+cC0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7734C169;
	Tue,  3 Sep 2024 14:19:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725365996;
	bh=M+1eMu36ZFzjE8m4MylaGnyG/DJD4w8EeqQ7v4hF5uU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ppjj+cC0CFhtEqChLAKAVZVJaK495VeaQ8o5w1yoAN2XoUWfhIoCSeZ8fbfhWB+AC
	 zdvzAyBDSvLa+EqeWtLmNGJqtABocPfrwZIBqVTULUaeQwp9/VVDkLR1OpG8vlXWf5
	 hP/lWyCfd5xknu1ACXc0fE1tVgjESd0t3AyL3xx4=
Date: Tue, 3 Sep 2024 15:20:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Milan Zamazal <mzamazal@redhat.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: Interest for a libcamera workshop in Vienna - September 17th
Message-ID: <20240903122036.GD5053@pendragon.ideasonboard.com>
References: <20240729090042.GA2725@pendragon.ideasonboard.com>
 <87ed613rtn.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ed613rtn.fsf@redhat.com>

On Tue, Sep 03, 2024 at 01:22:12PM +0200, Milan Zamazal wrote:
> Hi,
> 
> as for agenda, would there be an interest to add an item about what and
> how we would like to achieve with software ISP in the foreseeable
> future?

Good topic. I've added it to the list.

-- 
Regards,

Laurent Pinchart

