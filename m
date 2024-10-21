Return-Path: <linux-media+bounces-19999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB859A7260
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 20:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1AC3280F48
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 18:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C6C1F9429;
	Mon, 21 Oct 2024 18:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anr9ARiZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8113A1EF920
	for <linux-media@vger.kernel.org>; Mon, 21 Oct 2024 18:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729535536; cv=none; b=HR4JA2Bb1vcnheLuxNni7RBUt6OBVsp0jeXAX/PQdHk2IT2wdy/QLTaVZhtzU9WSxbyxVb24TXdzWsg2Tma6mZWy/ZIadQcKpS10yjB7DCsd9NxzjGINAGvtB1ifsCAT8sEZd8h/UlF4mj4Bf6uEV7ZnO/1MikqozLK9OL5Qf94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729535536; c=relaxed/simple;
	bh=/Jikqjf0CL0KpCnJvp147SdJ4zfDd78X0ocM783HjtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OsZaf0Z9C8LrZwJUaztkvYhyt2bXAq5AdcuF9HWKt/N1gGnZ+U2ewV+zGOhHLYrw11qo7LOhPvPYsXj0gy+nUtpPW1n//4ipUjtxc5o61WBknP+uZvPtvcra72VoSVcm2+ZK/YOImLDTBR3KJkidVrwe76w3kvRSq6hokL9h4R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anr9ARiZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so46824755e9.3
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2024 11:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729535531; x=1730140331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1zdjYjzLIbLJ1CeQLm3iN32vtd7+t/ewsVsWD0EwaRw=;
        b=anr9ARiZFk5d8ggzn9+OI47z6ttmn07IfBf+xF9wqb8R5yBoNK0YiKBXhg6CZNlx45
         pZHm7Eyd1L1h/kCzleTJali30xG+Qhe+SNn/ZIU1AqAdWgQjQq27aj4oLrWczGPrrEPC
         U+9l0VKmy9OVBiPepOlrOoXCaOEgbXWdNinwWIanTMp2kRCwnXtrOmH7RWTw900Qdzn9
         IkNJuXem0RnSJ9BC7eig92PqhS3OIWSU3iMLYQ6fflt+z9e9cx0jf+2h95JKwCMOV1TE
         ePxyQ8LFGy0zOVieIJHPuX8mKdTDvlBtGkFpZypxrz97pGV8+imqZ91gUxHfUy0+Knsy
         oOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729535531; x=1730140331;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zdjYjzLIbLJ1CeQLm3iN32vtd7+t/ewsVsWD0EwaRw=;
        b=bwO6q+3xwnNQRBwuzxY77+UzekHXV0Dl6pO7GQEIWnYCiPl2UbwMuzWNOMXJdnnoNl
         4O0ebTs2PmOrbvNEe4PAzSUFL5vgr3vtfKqTJF8TUQL863+WukJDh+nXXCLoPyViAuRq
         4VDY/Z9TkkPNEDD0sVYjC/4X+YKpGW0bhWDgmndApYmIUVYnw3V7Qc5fGHI59A9B3MJD
         +PEaFfQpLrVyepNhc3zkcwEwOkcqUAoV3MYAPEPvAvhMq2zIuH/Jy3iOweUCcWDvnyDw
         NvM5A0yyycorvFGzyG7MMHjW6whE2VJcx+ep74hKqTO8Ib9ZUZiZLZChNzpT6Pnkns9w
         vCCw==
X-Forwarded-Encrypted: i=1; AJvYcCUCvAH3QeCYq1eU0EpcXAaS7bqbArsoJjXs2AhrIscBFQlDSIq6KvGwSXyWiSklXINcZLUlHlRLBU4fKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHnhEe4uTDwV7w0XgEMAkk/WF4JL99eTUTDRAVy7LyoYJDgbA4
	Mp8bPorhIeQlRYACuIO4CtTiZ0OORl6lJGZ9oCB5CjYoH0dMyQOEG2S/9hhR7uQ=
X-Google-Smtp-Source: AGHT+IFDLZOKaqhkhui6EMc3gIgkUVJEas1IGzwEGyYVgYkTxW78PTyBKKBlS2Pik987FUlfa78QAA==
X-Received: by 2002:a05:600c:4ed2:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-4316163b8bbmr94064995e9.8.1729535530704;
        Mon, 21 Oct 2024 11:32:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a585f7sm4866289f8f.51.2024.10.21.11.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 11:32:10 -0700 (PDT)
Date: Mon, 21 Oct 2024 21:32:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 01/13] media: v4l2-ctrls-api: fix error handling for
 v4l2_g_ctrl()
Message-ID: <6d638db8-956c-44e4-a842-590c00e42e80@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d36ccf66f48a870c9bc0f7e9fda595505c4d342.1729230718.git.mchehab+huawei@kernel.org>

Hi Mauro,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/media-v4l2-ctrls-api-fix-error-handling-for-v4l2_g_ctrl/20241018-181159
base:   https://git.linuxtv.org/media_stage.git master
patch link:    https://lore.kernel.org/r/4d36ccf66f48a870c9bc0f7e9fda595505c4d342.1729230718.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH v2 01/13] media: v4l2-ctrls-api: fix error handling for v4l2_g_ctrl()
config: i386-randconfig-141-20241021 (https://download.01.org/0day-ci/archive/20241022/202410220105.oP6D4QD7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410220105.oP6D4QD7-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls-api.c:825 set_ctrl_lock() warn: inconsistent returns 'ctrl->handler->lock'.

vim +825 drivers/media/v4l2-core/v4l2-ctrls-api.c

71c689dc2e732d4 Hans Verkuil          2021-04-27  812  static int set_ctrl_lock(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl,
71c689dc2e732d4 Hans Verkuil          2021-04-27  813  			 struct v4l2_ext_control *c)
71c689dc2e732d4 Hans Verkuil          2021-04-27  814  {
71c689dc2e732d4 Hans Verkuil          2021-04-27  815  	int ret;
71c689dc2e732d4 Hans Verkuil          2021-04-27  816  
71c689dc2e732d4 Hans Verkuil          2021-04-27  817  	v4l2_ctrl_lock(ctrl);
54c5e2c49a4358b Mauro Carvalho Chehab 2024-10-18  818  	ret = user_to_new(c, ctrl);
54c5e2c49a4358b Mauro Carvalho Chehab 2024-10-18  819  	if (ret)
54c5e2c49a4358b Mauro Carvalho Chehab 2024-10-18  820  		return ret;

v4l2_ctrl_unlock() before returning

71c689dc2e732d4 Hans Verkuil          2021-04-27  821  	ret = set_ctrl(fh, ctrl, 0);
71c689dc2e732d4 Hans Verkuil          2021-04-27  822  	if (!ret)
54c5e2c49a4358b Mauro Carvalho Chehab 2024-10-18  823  		ret = cur_to_user(c, ctrl);
71c689dc2e732d4 Hans Verkuil          2021-04-27  824  	v4l2_ctrl_unlock(ctrl);
71c689dc2e732d4 Hans Verkuil          2021-04-27 @825  	return ret;
71c689dc2e732d4 Hans Verkuil          2021-04-27  826  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


