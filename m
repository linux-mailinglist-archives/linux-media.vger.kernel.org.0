Return-Path: <linux-media+bounces-40-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E027E7F09
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ED71281463
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAAA38FB7;
	Fri, 10 Nov 2023 17:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gwQh1jch"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314B13AC3C
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:54 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A2402AD2B
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 02:59:18 -0800 (PST)
Received: from [100.94.55.57] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8DF9E66073EB;
	Fri, 10 Nov 2023 10:59:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699613956;
	bh=z0BrjMdnNgzkoL9njImoPC2doOYyXTZzSDych95BQa8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gwQh1jch16SKwpH+eMj36/i60cjhUV8vVsfqE3DIKi/BFhdGqwsJcbDyoNOnIs7Dm
	 kJf7t7j3R+rsXNZzdQCSi57jgIWug6cHm3mES+4YHQv+QwiJKwpLKWLP4rjm7foMgl
	 gAYU9FHelXnha4z5Ka2FClRc3wXHmMZWc8N9AxsdGFZcvlZuCiSzLn/sHmcUVUE87Q
	 5XMV69ot4dgedt8MUV4zJJDm5d1fvnSem/BFlfQL6cAkMLj/jAgG7bYGbcmswg71eE
	 FNaxVqmewydsdQ18ypLKPmvJ73HiPd4TiEXufn79+1cdQoe1yq3Y1fwpC2slV3SK5g
	 /XEVuYZg7nZeQ==
Message-ID: <0c80f984-a675-4731-a39a-5f8e627535e8@collabora.com>
Date: Fri, 10 Nov 2023 12:59:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] media: microchip-isc: Remove dead code in pipeline
 validation
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
References: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
 <20231027091649.10553-4-laurent.pinchart@ideasonboard.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20231027091649.10553-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/23 12:16, Laurent Pinchart wrote:
> The isc_try_fse() function, called from isc_validate(), takes two
> parameters, an isc_device pointer, and a v4l2_subdev_state pointer. The
> isc_device is accessed but not modified by the function. The state is
> modified, including the struct v4l2_subdev_pad_config array it points
> to, but they are then never used by the caller. Furthermore, the V4L2
> subdev operation called by isc_try_fse() doesn't modify the subdev it is
> called on. The isc_try_fse() function has thus no effect, and can just
> be dropped.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---


Reviewed-by: Eugen Hristev <eugen.hristev@collabora.com>
Tested-by: Eugen Hristev <eugen.hristev@collabora.com>

Thanks for the patch Laurent and sorry for taking a bit long to test.

Eugen


