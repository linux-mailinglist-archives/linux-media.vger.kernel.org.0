Return-Path: <linux-media+bounces-8384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC5F8950FD
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 12:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F9D51C22BB6
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 10:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1885A5FBB2;
	Tue,  2 Apr 2024 10:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nBol0Rik"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CAA59B4B
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712055247; cv=none; b=WnWTIDBGeCGqZkRBRC35XEWtbmhhluHyCUPmNvpWQSPvbpR4kxU/wkMeof0LrBUpYOt4egzq0/W8K4sqoMkrSDG1VugPNbpoIqxBt1wYIDQwA8qtJlmbleLNYXAfJO3+ufAdLb4QMjhM42YaaYQr4d+JtWQQYFHM9nXcyxLtKII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712055247; c=relaxed/simple;
	bh=AFTrRvZUyDGT364ErJS2JLk0eq1Qw0WZYt+N0J31vtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eekQo9lfn78Td/o8Y6ZdgOAIK2lwbzIy4pEH/l+4K4471ols2sWHfIyb7I0t9RRm2YOe2dMNtgR9Dr03BrpHZF9Jsgwcwj9mOVJeoaSQzN5eg8Ojo1+L1I3hrsWH7ekQUhQUHn2wogt6l8EIkoHg+Y2z/0HHxZQiRtnab6cZcd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nBol0Rik; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7512C1A2;
	Tue,  2 Apr 2024 12:53:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712055207;
	bh=AFTrRvZUyDGT364ErJS2JLk0eq1Qw0WZYt+N0J31vtU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nBol0RikAUtsUos3TJBVLL4s/MSIGBawzIKCCXhkn7O9t6Pqb4Fr6lFnBj/XbQs0d
	 cSNU1j5030JdPiJ/JXYzaeT02TFPQioYeHBkJD5HYiBO2cbycEp5HW+S8yy70vpJsV
	 Pat7zUvDE4AwxsrMgpnues3k3JKwoJbRrfWeKEl0=
Message-ID: <f1575622-d1e8-45ac-bc4b-aa73373536d3@ideasonboard.com>
Date: Tue, 2 Apr 2024 13:54:00 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4l-utils] [PATCH 6/8] v4l2-compliance: Support the changed
 routing API
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Gregor Jasny <gjasny@googlemail.com>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
 <20240402000033.4007-7-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240402000033.4007-7-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/04/2024 03:00, Laurent Pinchart wrote:
> Set len_routes of struct v4l2_subdev_routing. ENOSPC error code is no
> longer used, i.e. having room for fewer routes than exist in the
> configuration is not considered an error anymore.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   utils/v4l2-compliance/v4l2-compliance.cpp   | 12 +++++++-----
>   utils/v4l2-compliance/v4l2-test-subdevs.cpp | 19 +++++++++++--------
>   2 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index 2cf979096bd0..72fe0bd778ab 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1272,15 +1272,17 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>   
>   			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
>   				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
> +				struct v4l2_subdev_routing &routing = sd_routing[which];
>   
> -				sd_routing[which].which = which;
> -				sd_routing[which].routes = (__u64)sd_routes[which];
> -				sd_routing[which].num_routes = NUM_ROUTES_MAX;
> +				routing.which = which;
> +				routing.routes = (__u64)sd_routes[which];
> +				routing.len_routes = NUM_ROUTES_MAX;
> +				routing.num_routes = 0;

Not part of this series, but something I noticed while testing. Our routing code is broken for 32-bit userspace: we convert the routes pointer to u64, which ends up sign extending the address.

Interestingly gcc gives "cast from pointer to integer of different size [-Wpointer-to-int-cast]", but g++ doesn't, and "command-line option ‘-Wpointer-to-int-cast’ is valid for C/ObjC but not for C++". So we don't get any warnings for the bugs.

With a quick look I found these places to fix. Will you add a patch to your series, or should I send this as a separate one?

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 72fe0bd7..a969b69c 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1275,7 +1275,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
                                 struct v4l2_subdev_routing &routing = sd_routing[which];
  
                                 routing.which = which;
-                               routing.routes = (__u64)sd_routes[which];
+                               routing.routes = (__u64)(uintptr_t)sd_routes[which];
                                 routing.len_routes = NUM_ROUTES_MAX;
                                 routing.num_routes = 0;
  
@@ -1307,7 +1307,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
                                         routes = sd_routes[which];
                                 } else {
                                         dummy_routing.num_routes = 1;
-                                       dummy_routing.routes = (__u64)&dummy_routes;
+                                       dummy_routing.routes = (__u64)(uintptr_t)&dummy_routes;
                                         dummy_routes[0].source_pad = pad;
                                         dummy_routes[0].source_stream = 0;
                                         dummy_routes[0].sink_pad = pad;
diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
index e26d09ed..21d7776a 100644
--- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
@@ -587,7 +587,7 @@ int testSubDevRouting(struct node *node, unsigned which)
         int ret;
  
         routing.which = which;
-       routing.routes = (__u64)&routes;
+       routing.routes = (__u64)(uintptr_t)&routes;
         routing.len_routes = 0;
         routing.num_routes = 0;
         memset(routing.reserved, 0xff, sizeof(routing.reserved));


  Tomi


