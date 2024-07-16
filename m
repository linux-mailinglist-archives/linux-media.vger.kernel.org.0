Return-Path: <linux-media+bounces-15055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E46932733
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 15:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF2EF281CC6
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 13:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1FC19ADBA;
	Tue, 16 Jul 2024 13:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="DoyPtpSQ"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724A019AD59
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 13:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721135515; cv=pass; b=U6ZSMlXFfarz8DnOhePMDVdxGlUmK4diZBgh33xrwF/qZd7Nef6TtuKMTmUKQS1FjLF/BssFqGKz+cboM7a2todXUNVhIcFFFwOE8yU1KKmX85TAIJFHMu/abVXWWZCMtj8P5iI8k44KqNXGCkUlfT3o6l5VpLCAuL9HdQjuArU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721135515; c=relaxed/simple;
	bh=cPc4j6BABDYJ/W6zKaWj0Rolwwm2eKrwc4PDfe+uBmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChBNPgt/IcOpEItqD+1WQl2kzD0SKziLT9V6mwb9wpQOdVqFHKCUlZFBLvswMrAnZGlN2/i0xDxz9w8vMTcKZQ64B6qVMrtI4TKKGLyhpjQIbH/FXVrPm2bJZLHdGbT1jjmZmwUztA8kgHylT+Ve62DmpjrfIjbVUxxOhXSV8iY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=DoyPtpSQ; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4WNfbn4PhXzyNf;
	Tue, 16 Jul 2024 16:11:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1721135510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H9SEfO+a5+4l63BXze6jT0f1LIaTtg2S/4uHs2LbxdU=;
	b=DoyPtpSQ4RxEiC60se5L8ah7YmdE8G/63sRJX4Vz//pcvNd1XS89ZJjER0lMygOVurwDQi
	5wmMAsbz568h3sy4/duCm7Zsy4gLUvrsl0AXvugU++CxJFchpdrj4pK9vNi9aAWhb3II0z
	04eWW8IJ6UATTMSZwX+G+PLwWjzF/e8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1721135510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H9SEfO+a5+4l63BXze6jT0f1LIaTtg2S/4uHs2LbxdU=;
	b=FJRpMktaUbjpOaizeJcCs0U6yYApI0+zg14XkfA1MAc/EBgLyZWIajNfcCaFVWu1yr0081
	S+WXrz9foY8MXeLhN0qtMPS4KrUWKF0eujuArIbuVb4P00Xz8nP1gcX35KsfWc/jSiFMNH
	jXBVp7nzOiwbwpD7vtv1ec6ktAaUKCY=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1721135510; a=rsa-sha256; cv=none;
	b=Kq6ddgFGvCaDd/lM/bSxg4dCTK0HNAd1BiDyj0E4TzJQ4g0KCYz93ardOPlwL31YifSoVl
	Sk5vYNWV93GuTPZiZ5qm+z7/l+wfFenTv/4a2UnZxnfd5S27MC6QNfM740IECGTycxt5xW
	RALh+Cd+/i8Vv6970oP19ehgrcb83oY=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id DFCCB634C93;
	Tue, 16 Jul 2024 16:11:45 +0300 (EEST)
Date: Tue, 16 Jul 2024 13:11:45 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Message-ID: <ZpZxkehjSa51Xbp3@valkosipuli.retiisi.eu>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <Zn6lrdkjy7B1Y0YU@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zn6lrdkjy7B1Y0YU@valkosipuli.retiisi.eu>

Hi Hans,

On Fri, Jun 28, 2024 at 11:59:42AM +0000, Sakari Ailus wrote:
> I'd be happy to join, either in person (likely) or remotely otherwise. I'll
> let you know once I have more information.

I'll be attending in person.

-- 
Sakari Ailus

