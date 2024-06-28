Return-Path: <linux-media+bounces-14332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4EC91BDF3
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 14:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A4FD1C228AD
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 12:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AE2158218;
	Fri, 28 Jun 2024 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="DD3AEw5Y"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645161865A
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719575995; cv=pass; b=BSuZOTelj1oFkOw+RyxoHJkaEACFRrSesMne/GbR2NWeOLK/60LBvNeKcBd1OWo7A3X/OYqUA2oJZ3F3CU8856sFmHKrDtmeAZ4obmyhDd8h2jQ8YE68e/TZrcsL0zMMfaeZCISfbxjSmZMq6aGfQ8gewAtiaw2Jazk/h/dP8tM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719575995; c=relaxed/simple;
	bh=MMpp+H2PZ7gwCYvJqT3ZegxQmgCsCzbctdbKKJCimiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rywvNykQfoe1u9ns0ZzunPuHQ0Dq+p0JPfCr3C6keWVxXfHz17OAsAXh4gkZPG1+OXbCVxmIHoEFb5dWsocCPD683/VOzVLpFpy8G0mHa1bkyQAzp7d91n49OYDhUB13UbhYkbJIEe4c4Uyz4M/+AVxQm+LjY3b/FSMssCx2OtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=DD3AEw5Y; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4W9Yrt5dxNzyR6;
	Fri, 28 Jun 2024 14:59:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1719575984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hG8gDv0rCgZXDazXRq3x0ISN3bbsA7Tfz8ak3YkRRvE=;
	b=DD3AEw5YVQvPswgi+LvCjmIfOMyxMa8lg/h7umGAx+tNuorZFAJki0uhGeaaC6CcUL2l1c
	/taD+fBRTEeEvK/pg/jWdGtFYDQwNcHwJebS0eBbQWkBsvm1bBXVjm/YcH9akBbDFkZGil
	cHx1i/nJHy9ypWoLGsN1TOqbRBd+fhg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1719575984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hG8gDv0rCgZXDazXRq3x0ISN3bbsA7Tfz8ak3YkRRvE=;
	b=v2b09RrDdh+wMjOlcoEqwLJjMJ5hMLdR9WsM9QdP+ZsE4clHDtRPXeTB+fAieWadtFvQfH
	nQbUIqeXSWOy9vD8M33Zo1XSmuKSohLGMRexy+5H6RL0MIWD7VJSiUOIZED8kv3KCQY54k
	7XQN6RzAQ2MeHzmqm0nFtkvCvXI6y7k=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1719575984; a=rsa-sha256; cv=none;
	b=RPlb3uYc2IYU6VipvR1pmGRrwwz05HOO7yEg6GY771Ffy8qfbvg5R20s21OVj0elUnxr7c
	t9mJnGGIvk0CO0wquAxZHm05qT+FGs9i4DZul9RUw1QBySUQ1esI8681nXW+O3lVftxf56
	ZaQqC0+AFwO1uU7thslC1FeO2T6TXAE=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id F297D634C93;
	Fri, 28 Jun 2024 14:59:41 +0300 (EEST)
Date: Fri, 28 Jun 2024 11:59:41 +0000
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
Message-ID: <Zn6lrdkjy7B1Y0YU@valkosipuli.retiisi.eu>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>

Hi Hans,

On Mon, May 06, 2024 at 01:33:32PM +0200, Hans Verkuil wrote:
> We will organize another Media Summit on Monday September 16th to coincide with
> the Open Source Summit Europe in Vienna:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/
> 
> Avnet Silica has very kindly offered to host this summit at their Vienna
> office, which is about 35 minutes by public transport from the OSSE venue.

I'd be happy to join, either in person (likely) or remotely otherwise. I'll
let you know once I have more information.

-- 
Kind regards,

Sakari Ailus

