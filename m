Return-Path: <linux-media+bounces-57579-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDyNJQZEymky7AUAu9opvQ
	(envelope-from <linux-media+bounces-57579-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:36:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE18358452
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33D61303DD35
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6613B4E9A;
	Mon, 30 Mar 2026 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOac5X6A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25A33A874F
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863041; cv=none; b=j4c9axpiXy5dO+jK95neRdkpc1F7NZF6VBX0RmSIrfxyAoGAwfl0fbB+ve4IeZ/INmV2aLYVQ7ANUi2HNJtGVKaMskow2683L5L/zf+42bXL8YujUmmYhNwp0y5M68rTxvw9jEGis1XoyeulBOI6kP5lCsujmrostFWl0g+X+fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863041; c=relaxed/simple;
	bh=dDXdYT1zf8jcRW3Lh7wW3hi8RufyCiCX8TZ7JkbPYLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T6SHdT5U4USRr2fEzQnc2I1RixzkH5FLReAvfAgXRtjszfEVK5TujiTfgwDSospu0aiYOeqndJjVqn81oGQad2+R7fvjjInUWRL4sVHqbm9yMo3igHDWLg1KiwCu1pBbude42db157kczuYvZsewxEqU7QAyGedZlQX5XC/BDII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOac5X6A; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fe655187so55135635e9.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 02:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863038; x=1775467838; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+az+AaDlx97xMl9c5AxMiWqH7QYTzxKlo69P1hgDlo=;
        b=IOac5X6AbRp+Q4yJxKakLZmCnhZ2CDQ+GVVykllRTpVLxXT4H6srXcHtNVsuFHJpjE
         9YW6ixW07Ps6Q9Ru851v+OB2ST+/qLKlc8D2F+EAM/416wT2ELfA2YaNPL2ak14BW2xp
         V7V+i3JLRYBYJ5Dzx552Q/RGFQB4B5KTPECFxFheNUWxfTvUdzOBtyiELNzM3ju3YKyT
         cYWIULoinqLEE+wisZwhpoQIOlJcadpiQyHliK7tySdPgZd7NSQlURIsDQxyfNrripAi
         5mGojkGSYfdxFdGk2VN/0nqRebsYg2XB5HvcbnGMxn0jI4L5vihePzQybimNaR2BtMqU
         1jYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863038; x=1775467838;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+az+AaDlx97xMl9c5AxMiWqH7QYTzxKlo69P1hgDlo=;
        b=BrLNE0iE0dbgMGGw25TgnvU/AiZglJk0MqconXPHEjb8B7tVuNxCtZ7z8f//7dGU0i
         ZB1ETCRp4wbOvb74Yzb5u07KOT+iT6ba7VBj1NdUhSWyzgmkOvIeocs3YGA6tlrp7df7
         2fXaJTQqNpW9N3doPPHIA5k3tMUpoCOgK377IqNB4gP4Ftx6ppgilNiod4wAcl2daphX
         aP21WZr73BV7SswSVhOP6il0y6OeO+z8F0OSRPEmLV717soLfDi8RFbYwYm8XzqqEekg
         jl/XcXlALCKYD0QXIYwVHvwUwFXwMZSN8QmxlwkdDpzdGh+GXmcM85x9fdBZngRYU0yD
         OvzA==
X-Forwarded-Encrypted: i=1; AJvYcCUVYGN54jas111uUesfxHOdQu7vRFKEoqCOSZuRC1AZhzfHFy4BcX2CxBjQ885SWpeO/L+jEi9xL37nIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3V/GO9g7/XyVlE3o3wmA6dH2n5+XUfbgxYIeaA6I/1Dde/esc
	QfIrYAdz2hJFriPqdQtUhhz4RaWyxemHDV0GMRdDWlG3MLt/+3+9VfauB3s6ZA==
X-Gm-Gg: ATEYQzywcZs002mlKJzZdERG1qmhSaP/QWrDSXWWmL5xHOvkKxQhnyf6n2JcBO9JN5C
	jLgxOPAgMq+lwIxqp2CskXdHLAOaMbkds1tAN8EjtytagyTzcQM7OLEi3JYoaVfiKfbfQbr+aY/
	XCb6JzwCSqzn0HE1AVuvy/S6NWW0jJpTxLOaimRsn6AX4/zltCFVaA/ayePcXFmkYAY1t5rxjO8
	bjrAOBk3FGsWfu1VJm4a2gYqyQ8FjDg3AymQ3iEJDPbxOmrU9EqeXoX/e3ogzEHkHXI6uoWpAcj
	UgbksdOraEga/4lRqTSTvxT0z0Q/eCTaQnutDOoZlJffjnGEXtEESkPZIeOjLvCbyxHEYiOlcye
	0uPeht+KuefHRd1+srpRFy9HF30YKyEFBKx7g+9f+cPAZxzkcp9Or7tv8QIi5YkAUKdAFD9Nams
	4SDtwceWjiBLQa/YNemC4=
X-Received: by 2002:a05:600c:8b08:b0:485:303b:c50a with SMTP id 5b1f17b1804b1-48727d73611mr192261325e9.13.1774863038151;
        Mon, 30 Mar 2026 02:30:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2577cbdsm18766581f8f.33.2026.03.30.02.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:30:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:30:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Kate Hsuan <hpa@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linuxtv-media-pending:next 165/183] drivers/media/i2c/t4ka3.c:577
 t4ka3_enable_stream() warn: pm_runtime_get_sync() also returns 1 on success
Message-ID: <acpCusUjXndiISEI@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57579-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: EFE18358452
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   4fbeef21f5387234111b5d52924e77757626faa5
commit: fd55319692151de2b89c21356d1445bce364769b [165/183] media: Add t4ka3 camera sensor driver
config: um-randconfig-r072-20260327 (https://download.01.org/0day-ci/archive/20260328/202603280011.CCbaQy6n-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603280011.CCbaQy6n-lkp@intel.com/

smatch warnings:
drivers/media/i2c/t4ka3.c:577 t4ka3_enable_stream() warn: pm_runtime_get_sync() also returns 1 on success

vim +577 drivers/media/i2c/t4ka3.c

fd55319692151d Kate Hsuan 2026-03-25  558  static int t4ka3_enable_stream(struct v4l2_subdev *sd,
fd55319692151d Kate Hsuan 2026-03-25  559  			       struct v4l2_subdev_state *state,
fd55319692151d Kate Hsuan 2026-03-25  560  			       u32 pad, u64 streams_mask)
fd55319692151d Kate Hsuan 2026-03-25  561  {
fd55319692151d Kate Hsuan 2026-03-25  562  	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
fd55319692151d Kate Hsuan 2026-03-25  563  	int ret;
fd55319692151d Kate Hsuan 2026-03-25  564  
fd55319692151d Kate Hsuan 2026-03-25  565  	ret = pm_runtime_get_sync(sensor->sd.dev);
fd55319692151d Kate Hsuan 2026-03-25  566  	if (ret < 0) {

pm_runtime_get_sync can return either zero or one on success.
(See the comments next to that function).  Probably use
pm_runtime_resume_and_get() instead.

fd55319692151d Kate Hsuan 2026-03-25  567  		dev_err(sensor->dev, "power-up err.\n");
fd55319692151d Kate Hsuan 2026-03-25  568  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  569  	}
fd55319692151d Kate Hsuan 2026-03-25  570  
fd55319692151d Kate Hsuan 2026-03-25  571  	cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
fd55319692151d Kate Hsuan 2026-03-25  572  			    ARRAY_SIZE(t4ka3_init_config), &ret);

If we pass 1 to cci_multi_reg_write() it is treated
as an error and it returns immediately.

fd55319692151d Kate Hsuan 2026-03-25  573  	/* enable group hold */
fd55319692151d Kate Hsuan 2026-03-25  574  	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
fd55319692151d Kate Hsuan 2026-03-25  575  	cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_regs,
fd55319692151d Kate Hsuan 2026-03-25  576  			    ARRAY_SIZE(t4ka3_pre_mode_set_regs), &ret);
fd55319692151d Kate Hsuan 2026-03-25 @577  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  578  		goto error_powerdown;

And we error out here with ret == 1.

fd55319692151d Kate Hsuan 2026-03-25  579  
fd55319692151d Kate Hsuan 2026-03-25  580  	ret = t4ka3_set_mode(sensor, state);
fd55319692151d Kate Hsuan 2026-03-25  581  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  582  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  583  
fd55319692151d Kate Hsuan 2026-03-25  584  	ret = cci_multi_reg_write(sensor->regmap, t4ka3_post_mode_set_regs,
fd55319692151d Kate Hsuan 2026-03-25  585  				  ARRAY_SIZE(t4ka3_post_mode_set_regs), NULL);
fd55319692151d Kate Hsuan 2026-03-25  586  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  587  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  588  
fd55319692151d Kate Hsuan 2026-03-25  589  	/* Restore value of all ctrls */
fd55319692151d Kate Hsuan 2026-03-25  590  	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
fd55319692151d Kate Hsuan 2026-03-25  591  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  592  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  593  
fd55319692151d Kate Hsuan 2026-03-25  594  	/* disable group hold */
fd55319692151d Kate Hsuan 2026-03-25  595  	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
fd55319692151d Kate Hsuan 2026-03-25  596  	cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
fd55319692151d Kate Hsuan 2026-03-25  597  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  598  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  599  
fd55319692151d Kate Hsuan 2026-03-25  600  	sensor->streaming = 1;
fd55319692151d Kate Hsuan 2026-03-25  601  
fd55319692151d Kate Hsuan 2026-03-25  602  	return ret;
fd55319692151d Kate Hsuan 2026-03-25  603  
fd55319692151d Kate Hsuan 2026-03-25  604  error_powerdown:
fd55319692151d Kate Hsuan 2026-03-25  605  	pm_runtime_put(sensor->sd.dev);
fd55319692151d Kate Hsuan 2026-03-25  606  
fd55319692151d Kate Hsuan 2026-03-25  607  	return ret;
fd55319692151d Kate Hsuan 2026-03-25  608  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


