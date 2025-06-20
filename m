Return-Path: <linux-media+bounces-35451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DDDAE1125
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 04:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71CF63BDF22
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 02:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1661C1AF0CE;
	Fri, 20 Jun 2025 02:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GuWaX3CD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C9C1AD3E0
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 02:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750387011; cv=none; b=fznbMBKUxQVeX4WOlLJUmuMf4rj4/ukIn85uHnHWIPARucKXHx33h2SomuYLgnEpPUpRHeqqIRZwNv0bkKR/15ue4LFZNuP6+ssPSh7RuSPrgnUAlvxGjJ9D4zxKnQb/aKCy57+kDYk74GwP+BvqlS6Yv9ZdlVLiVxrXRI8bYBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750387011; c=relaxed/simple;
	bh=hG1ZdXViD6AbAyDwakvGzzsX8OTenI6ot8PMxV7TY9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jcfBziy00uCaELGSUYwcdjqI3I/wMYLoA2bSkV9+DmrIepPKV564Hj0HSzpvjE3qVv85WhNxdQalsLGp5lG7HpjhL7sLywk0ntFI16Kj5XP5EcWfWoUboKnXQr+x4fUlNIlDKJtBhuMCZPj3W8mxwyoeuMbLtbPblg2GE57qCHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GuWaX3CD; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-739dcdb012fso413313a34.2
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 19:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750387008; x=1750991808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JzM92pnb5kciFT5sFfWWCwGdEyggW8xJbiGstXoCan0=;
        b=GuWaX3CD9F9UF/NZzi7dDRet4WK2Dg+M0Y75yXSi29iHzZts9EGHMvmz6svfd0QlGy
         7ocKAkAHTZUaTP6dP1BeMpUP6CcpCtnvgVuuxXn8pm5XVAIR9Q78rnd42jHtcaqA9OwO
         DJxjchry3olFllbAc1udJqpk68e2a4GGZj6NCcIeIQEOAuROCJtqv3CDeA4J1ieoOMKC
         KLu1KBTVkGixororx9FPakUQ6fBhn4bCQnZh620J8Te+AVKbCOeJedegCWEWH33KJSyS
         /u8x0pX85917y0E//qeRbYLGY/jKyJjfx9p78Tf9eZZIlNKknASdFX26TW0wzOrMn5kj
         3SRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750387008; x=1750991808;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzM92pnb5kciFT5sFfWWCwGdEyggW8xJbiGstXoCan0=;
        b=pAwt8+zEfUNFtcbCcWamyaKFUi6zCLIaiOd8p0aId8gUMnuU9pKsMI6BwRODpNhw2K
         ynJyCaJSYSG0tY2Z4LMZTOp9GO2VIhp+bWP9mp6m0ecRt0t5oxzFQWCvvIr1FB54MDLm
         E3BdCRfnRtIl/H4pEaaM6x0P4teFVXxBTBJkL/tz0pZM1hOQrpaCoXjp8P3oiZL6d/CS
         SDpN5Mt6O/R/uFJGacVJdMHFBgwL+L260HNlUXKXhMh38YuSft8JwPykkuzJNMFt/BT0
         OWJaaqHx9Nbr1z2mWhy3JUHkyRBdBZA47cCUw4gTv3DBXyNzGGE1c0WHnNVOm1tNyxDQ
         rePw==
X-Forwarded-Encrypted: i=1; AJvYcCViadT4hUJnuDOcXGwYCs2nJdsGol4S4EWmlmlUtQfcZ4n3iL394qT/GJuJUOCdTVeLbwiHhUDhZFnFaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE8uxJWY+FIRRPqNttgS8wNbb7XBkIWieqzhibup89o4oS/5Cp
	BgMXlLuQUXsxwgf5BuqXLlbtU31hqJrJ2yEk2+ZZldR59f3whhSyZm5cQQV8pSK5Pjw=
X-Gm-Gg: ASbGncs8e2Tl0dVC32l1LJd0OX6MJKfhcRCRvj0jErMh5ohxm/MMiE7aTHp84Y6TX5D
	FzShkF5vFAiNQG4dut8unCemBjHgE4AkD/VW4sJJ29oqhX5w7OQjJd3EuQNMsmTQxi92QRIY/Fl
	1N4JQ0c3Gn2VmwegVKA4KjMS73OImHcWyazue9aweUH31Tex3MsL3u9Fs96xerJ2sUvC/l72A16
	QBkZOH+yz5CvmEoB1jXvrhUDQHrJpIfg+MM7Bp9udAMSZoItaIbuMs3MEXnlcMbxO4oXOSI9MrZ
	BXv3ZZyQTAcSWz6VIFh5CUeYzzM+mJi096Lt66xdkJdHg8QdMWa4pXeC56xW8+/7pZivjbxKxmZ
	J9ZYr
X-Google-Smtp-Source: AGHT+IHC5MEthcpCCp8n0W5HVZ30ICKD25Cgr7vOwziWL9tEqFSbHlhXS1cd+FIagwiDa2O+PavoSQ==
X-Received: by 2002:a05:6870:40c7:b0:2d5:cb5:2193 with SMTP id 586e51a60fabf-2eeee655a28mr1041121fac.35.1750387007762;
        Thu, 19 Jun 2025 19:36:47 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee664c0dcesm197478fac.9.2025.06.19.19.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 19:36:47 -0700 (PDT)
Date: Fri, 20 Jun 2025 05:36:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 2/3] media: v4l2-ctrls: Return the handler's error in
 v4l2_ctrl_handler_free()
Message-ID: <5a78e918-b44c-40f5-a6c7-b53828e27450@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619095227.1939114-3-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l2-ctrls-Don-t-reset-handler-s-error-in-v4l2_ctrl_handler_free/20250619-175457
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250619095227.1939114-3-sakari.ailus%40linux.intel.com
patch subject: [PATCH v2 2/3] media: v4l2-ctrls: Return the handler's error in v4l2_ctrl_handler_free()
config: i386-randconfig-141-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201045.80WKwL22-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506201045.80WKwL22-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls-core.c:1641 v4l2_ctrl_handler_free() error: we previously assumed 'hdl' could be null (see line 1640)

vim +/hdl +1641 drivers/media/v4l2-core/v4l2-ctrls-core.c

b56f94c6d2dfdd Sakari Ailus 2025-06-19  1634  int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
71c689dc2e732d Hans Verkuil 2021-04-27  1635  {
71c689dc2e732d Hans Verkuil 2021-04-27  1636  	struct v4l2_ctrl_ref *ref, *next_ref;
71c689dc2e732d Hans Verkuil 2021-04-27  1637  	struct v4l2_ctrl *ctrl, *next_ctrl;
71c689dc2e732d Hans Verkuil 2021-04-27  1638  	struct v4l2_subscribed_event *sev, *next_sev;
71c689dc2e732d Hans Verkuil 2021-04-27  1639  
71c689dc2e732d Hans Verkuil 2021-04-27 @1640  	if (hdl == NULL || hdl->buckets == NULL)
                                                    ^^^^^^^^^^^
hdl is NULL

b56f94c6d2dfdd Sakari Ailus 2025-06-19 @1641  		return hdl->error;
                                                               ^^^^^^^^^^
Dereferenced.

71c689dc2e732d Hans Verkuil 2021-04-27  1642  
71c689dc2e732d Hans Verkuil 2021-04-27  1643  	v4l2_ctrl_handler_free_request(hdl);
71c689dc2e732d Hans Verkuil 2021-04-27  1644  
71c689dc2e732d Hans Verkuil 2021-04-27  1645  	mutex_lock(hdl->lock);
71c689dc2e732d Hans Verkuil 2021-04-27  1646  	/* Free all nodes */
71c689dc2e732d Hans Verkuil 2021-04-27  1647  	list_for_each_entry_safe(ref, next_ref, &hdl->ctrl_refs, node) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


