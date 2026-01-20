Return-Path: <linux-media+bounces-51090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E2279D3BF3A
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 07:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9A9F34F2C3D
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 06:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4ED936C5A3;
	Tue, 20 Jan 2026 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6JunMv9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E565350D4D
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890414; cv=none; b=idGbMdc6KXtXMYBMMhTzwdGzqOj+qOTMpSnL3BQ76gF724ELmfQab9pAUkLTbZIs0n20wj/0WQpgum9z1+X4ztElK+jyyqv2S+C5VRuyWeaZ1XEfl05t6iepEYJz7zEIQQ+wGvmBWkgaE1hOQZf2EfJuFAN7m/zgdKFofns9MT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890414; c=relaxed/simple;
	bh=M2+epky3SCcKG7Uh4ZhhekY7jWxAlk8pOjMvj6bO0U8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nvr84CgnHpIyn7IuZN7P6TN9kc+kd2YWXZAxyB7B1aAlUn+13q9GZ0hSR0bgghWBiF3rre9bViyVvdNV7eg6dAmdraSyFNlDoCYQnWOkvSpB2xVY7dqcuKXCA3oV1XC7YRNePX/40RjBi6/SnzwFnrhqPJBD5MHCYoIQS/Mmh5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6JunMv9; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso17163095e9.2
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 22:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768890409; x=1769495209; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exJxoP7zFCz/hmkwpZpelGDTG6raORe92bixilLY+WE=;
        b=U6JunMv9Q53W2bI7nbCTIsMB/htf0w4phXzr4hoajnm/6KpWzky56CneRC/kXO49RU
         AC7Ril8rTzfrBDraai7831gKPu9XNFqk8GVID78seUtyk4ugLRx+ip/um5msLXs0bU69
         Q5v39t4XhV69QKKs1ymjXRthADRD/LECMKdMBwWmFbfQa48gDVeQjTZD6Y5VJq1Tg3aK
         8QRU69rLckBmyzRzus474HTFM2oqguL1vhNVlVaUdHiJqj+0QCX74lNmIee218AZaxA8
         lH8wxiKnqQlOL/g2VLx5DlZkqNBuidnGJ4IXKn1yDcchQkCg9A+U9G3D6U1GLwkM0SKg
         iW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890409; x=1769495209;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exJxoP7zFCz/hmkwpZpelGDTG6raORe92bixilLY+WE=;
        b=OYaSEbDzs2ARBzFaobHGvDUjw3yN1uam5YqeFXeBCN1BfK48JY5D1sU+IvB8gUMLLV
         gbcX9Vbx63H/qkqga1/ZL33Sq8lQ8NBZluVR7heSL8cwZ6ERixmNv7MCvFDXT3wnNno2
         BLc30t3bFxbmDPu1baU07CczJydbfdW+/mAyw4lOHGSrSXeRecO5tKOHVC35FC55dm5X
         UqUBcz6hFuvPKpqnubxFBO6knFZS0WNaOENZeGXaWQqQQdccObYaUeGGrHnCUDIl7ECX
         7R5+1jz4x7EcqsfutylHTWizeMHttCQYPOkF7rLXkPIDv/lELy+DMGDhI2Lsjj/JmTVy
         iofA==
X-Forwarded-Encrypted: i=1; AJvYcCXJJR37BKtFtrU4uwItE5jQuP7ZzAI7q4ZX/S5QMx04K8pj4nXhyC1VW+vzve7nr1KP/1p1CQ58MDbu4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLfdGeKDJr/sgRxzNLD3CF0CVneeD2lKjvR+9gcTMmtFYfWOID
	KV+hm8OutJtyHaGr6KenXXG/KHlWSXMk5d5DgyaW9LA7FVQcrAuvzFLQi8xZlTgy8E0=
X-Gm-Gg: AY/fxX72vfEHgoimV2rz1hkwlcaXeK7ckshMBO+5jdgF1vJAi8Y6r6QqHAQPzDk1kg/
	XHDdjRgmyqd6Ft2Wj1Ab9DSXofCODul/xqPPDTbKi02uNU9tM171exl4BunHZS3esobReN7yVrp
	Exx7Ct0HU2XRLXau/mnlQhnZZQ2XvYmXo3EAr1H2uLNL9JAYlc7j5lFZkrKxRhncaZIzG9hFpIC
	SPvKMjrmogcCYL/mhJ3JZl/5b/6KLu3UXgVlq51PopRXa+xmwC70jyk6stF/BZGl2wcqHOH049W
	UxNiH9NAtDv1tq8+Rjk49DUKS1/VdAa/N2/6wzr3vi/VR8qTNBEqg7IFi2wOmXzzJjf3mt/flZb
	GIPP6AB3sKMEbkj8BAkLF0oKhIChIhmd8/13h8sJAVxu8d7uAiigcUlVgJRpRmh7DRkjz+MDSMH
	zMRBG6CP7//YHOTMcr
X-Received: by 2002:a05:600c:35c3:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-4801eac0617mr174645185e9.9.1768890409197;
        Mon, 19 Jan 2026 22:26:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d77besm235669065e9.14.2026.01.19.22.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:26:48 -0800 (PST)
Date: Tue, 20 Jan 2026 09:26:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 91/113] drivers/media/mc/mc-entity.c:893
 __media_pipeline_start() warn: missing unwind goto?
Message-ID: <202601200249.VHkXezfb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   55ba38aaeb6e07cbbbe550578fa4737b05de1d00
commit: 1ca6e7fbe27c6587da496d4288217661a788731f [91/113] media: mc: Separate single link validation into a new function
config: x86_64-randconfig-161-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200249.VHkXezfb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601200249.VHkXezfb-lkp@intel.com/

smatch warnings:
drivers/media/mc/mc-entity.c:893 __media_pipeline_start() warn: missing unwind goto?

vim +893 drivers/media/mc/mc-entity.c

ff0f0353826d19d drivers/media/mc/mc-entity.c Sakari Ailus              2024-10-19  819  __must_check int __media_pipeline_start(struct media_pad *origin,
e02188c90f6ef61 drivers/media/media-entity.c Laurent Pinchart          2010-08-25  820  					struct media_pipeline *pipe)
e02188c90f6ef61 drivers/media/media-entity.c Laurent Pinchart          2010-08-25  821  {
ff0f0353826d19d drivers/media/mc/mc-entity.c Sakari Ailus              2024-10-19  822  	struct media_device *mdev = origin->graph_obj.mdev;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  823  	struct media_pipeline_pad *err_ppad;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  824  	struct media_pipeline_pad *ppad;
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  825  	int ret;
e02188c90f6ef61 drivers/media/media-entity.c Laurent Pinchart          2010-08-25  826  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  827  	lockdep_assert_held(&mdev->graph_mutex);
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  828  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  829  	/*
b516354542b7163 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-12-12  830  	 * If the pad is already part of a pipeline, that pipeline must be the
b516354542b7163 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-12-12  831  	 * same as the pipe given to media_pipeline_start().
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  832  	 */
ff0f0353826d19d drivers/media/mc/mc-entity.c Sakari Ailus              2024-10-19  833  	if (WARN_ON(origin->pipe && origin->pipe != pipe))
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  834  		return -EINVAL;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  835  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  836  	/*
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  837  	 * If the pipeline has already been started, it is guaranteed to be
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  838  	 * valid, so just increase the start count.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  839  	 */
b7319e2bd7bd774 drivers/media/mc/mc-entity.c Tomi Valkeinen            2022-08-31  840  	if (pipe->start_count) {
b7319e2bd7bd774 drivers/media/mc/mc-entity.c Tomi Valkeinen            2022-08-31  841  		pipe->start_count++;
3056a8e936bb090 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-01-13  842  		return 0;
3056a8e936bb090 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-01-13  843  	}
3056a8e936bb090 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-01-13  844  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  845  	/*
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  846  	 * Populate the pipeline. This populates the media_pipeline pads list
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  847  	 * with media_pipeline_pad instances for each pad found during graph
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  848  	 * walk.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  849  	 */
ff0f0353826d19d drivers/media/mc/mc-entity.c Sakari Ailus              2024-10-19  850  	ret = media_pipeline_populate(pipe, origin);
74a4133079f739e drivers/media/media-entity.c Sakari Ailus              2015-12-16  851  	if (ret)
3056a8e936bb090 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-01-13  852  		return ret;
106b9907c368e32 drivers/media/media-entity.c Sakari Ailus              2015-12-16  853  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  854  	/*
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  855  	 * Now that all the pads in the pipeline have been gathered, perform
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  856  	 * the validation steps.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  857  	 */
e02188c90f6ef61 drivers/media/media-entity.c Laurent Pinchart          2010-08-25  858  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  859  	list_for_each_entry(ppad, &pipe->pads, list) {
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  860  		struct media_pad *pad = ppad->pad;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  861  		struct media_entity *entity = pad->entity;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  862  		bool has_enabled_link = false;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  863  		struct media_link *link;
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  864  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  865  		dev_dbg(mdev->dev, "Validating pad '%s':%u\n", pad->entity->name,
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  866  			pad->index);
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  867  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  868  		/*
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  869  		 * 1. Ensure that the pad doesn't already belong to a different
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  870  		 * pipeline.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  871  		 */
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  872  		if (pad->pipe) {
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  873  			dev_dbg(mdev->dev, "Failed to start pipeline: pad '%s':%u busy\n",
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  874  				pad->entity->name, pad->index);
8aaf62b5b9bef73 drivers/media/media-entity.c Sakari Ailus              2015-11-29  875  			ret = -EBUSY;
8aaf62b5b9bef73 drivers/media/media-entity.c Sakari Ailus              2015-11-29  876  			goto error;
8aaf62b5b9bef73 drivers/media/media-entity.c Sakari Ailus              2015-11-29  877  		}
8aaf62b5b9bef73 drivers/media/media-entity.c Sakari Ailus              2015-11-29  878  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  879  		/*
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  880  		 * 2. Validate all active links whose sink is the current pad.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  881  		 * Validation of the source pads is performed in the context of
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  882  		 * the connected sink pad to avoid duplicating checks.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  883  		 */
549e622b22ad35d drivers/media/mc/mc-entity.c Daniel Scally             2022-07-07  884  		for_each_media_entity_data_link(entity, link) {
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  885  			/* Skip links unrelated to the current pad. */
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  886  			if (link->sink != pad && link->source != pad)
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  887  				continue;
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  888  
1ca6e7fbe27c658 drivers/media/mc/mc-entity.c Sakari Ailus              2025-12-08  889  			ret = __media_pipeline_validate_one(origin, pipe,
1ca6e7fbe27c658 drivers/media/mc/mc-entity.c Sakari Ailus              2025-12-08  890  							    origin, link,
1ca6e7fbe27c658 drivers/media/mc/mc-entity.c Sakari Ailus              2025-12-08  891  							    &has_enabled_link);
1ca6e7fbe27c658 drivers/media/mc/mc-entity.c Sakari Ailus              2025-12-08  892  			if (ret)
1ca6e7fbe27c658 drivers/media/mc/mc-entity.c Sakari Ailus              2025-12-08 @893  				return ret;

goto error?

ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  894  		}
de49c285a360495 drivers/media/media-entity.c Sakari Ailus              2013-10-13  895  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  896  		/*
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  897  		 * 3. If the pad has the MEDIA_PAD_FL_MUST_CONNECT flag set,
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  898  		 * ensure that it has either no link or an enabled link.
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  899  		 */
b3decc5ce7d7782 drivers/media/mc/mc-entity.c Laurent Pinchart          2024-01-15  900  		if ((pad->flags & MEDIA_PAD_FL_MUST_CONNECT) &&
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  901  		    !has_enabled_link) {
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  902  			dev_dbg(mdev->dev,
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  903  				"Pad '%s':%u must be connected by an enabled link\n",
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  904  				pad->entity->name, pad->index);
47dfdb3a888733a drivers/media/media-entity.c Helen Mae Koike Fornazier 2015-06-28  905  			ret = -ENOLINK;
de49c285a360495 drivers/media/media-entity.c Sakari Ailus              2013-10-13  906  			goto error;
de49c285a360495 drivers/media/media-entity.c Sakari Ailus              2013-10-13  907  		}
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  908  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  909  		/* Validation passed, store the pipe pointer in the pad. */
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  910  		pad->pipe = pipe;
e02188c90f6ef61 drivers/media/media-entity.c Laurent Pinchart          2010-08-25  911  	}
e02188c90f6ef61 drivers/media/media-entity.c Laurent Pinchart          2010-08-25  912  
b7319e2bd7bd774 drivers/media/mc/mc-entity.c Tomi Valkeinen            2022-08-31  913  	pipe->start_count++;
3056a8e936bb090 drivers/media/mc/mc-entity.c Laurent Pinchart          2022-01-13  914  
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  915  	return 0;
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  916  
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  917  error:
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  918  	/*
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  919  	 * Link validation on graph failed. We revert what we did and
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  920  	 * return the error.
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  921  	 */
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  922  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  923  	list_for_each_entry(err_ppad, &pipe->pads, list) {
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  924  		if (err_ppad == ppad)
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  925  			break;
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  926  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  927  		err_ppad->pad->pipe = NULL;
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  928  	}
af88be3887c1a0b drivers/media/media-entity.c Sakari Ailus              2012-01-11  929  
ae219872834a32d drivers/media/mc/mc-entity.c Laurent Pinchart          2022-08-31  930  	media_pipeline_cleanup(pipe);
106b9907c368e32 drivers/media/media-entity.c Sakari Ailus              2015-12-16  931  
fb49f20438f361a drivers/media/media-entity.c Shuah Khan                2016-02-11  932  	return ret;
fb49f20438f361a drivers/media/media-entity.c Shuah Khan                2016-02-11  933  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


