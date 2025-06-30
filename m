Return-Path: <linux-media+bounces-36328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C9CAEE409
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 18:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CB0C7A8515
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 16:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5C1299957;
	Mon, 30 Jun 2025 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VTO1O5TW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD84298CAB
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 16:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299970; cv=none; b=I0lf4QMs1G8uo2Si4Wu1ywGcoyhlEjCzet6+dJDRKZXNP0rn8c4CppfPCHNTG+aWu60v4SBCxOwX97r6WVca33wLuf+xeJbjanSKWvMetsHimPQbA0vmXHAAl+HKNMAIBe+nMfMsJWZ+pJ/tr4gAby6Ihqp/mWfxckAh28sGbVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299970; c=relaxed/simple;
	bh=q4VIj35HGYUMrlmf/wPQyD4fjoYIUJIrYvqyNvRayR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VfaYq6bJGhGrKrOKQkPFwjTQTKEQjfDblEyN0PAJCzMhPFQKyM1wir76OWwsLiQDjEw0ybotEMSydHEQA71AlmMdIDDR0axTaizMDw4FCAVaWcEhkqfMPL52VIVINYbCMg5Vkgr/17FuT2LDeh5gdUJOllqPztR3wNmQNxqprrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VTO1O5TW; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72c13802133so712854a34.3
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 09:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751299968; x=1751904768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pdpheBuXy6YZBSAAaSyOQsX5JfXKwGuw8lus8OBrp2Y=;
        b=VTO1O5TWcOJwA2x5zFHWwXtfwvKZij7C2SDUIXCFdTU/dhTIxgl7S8uUmhmjX7tg+o
         Rzz4MqknZDpm4f6bGoPJO66mFBorVaIS9LDcaqvnGv6vnOuSLeSndTkkjVrISHW88XbJ
         rd2gmPeF2tjMCsLyHEk70jPmycpGv5A71Kl4I8t9Um2QV3krtnDIjM015wCiTj2yn1BW
         Hlk/sTYLJwMwzqO9gF2pElCGBzw60glpUnQ7hlBtKfbsPsd7gqyJj/rb20zEKJnyHxyI
         zn1lu72XoQ3Rc8aSkLfkWBIbdLZtq0qziLOk12n1EI2Us3xvQeybXa2NmMFHKdmcDDSr
         qs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751299968; x=1751904768;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdpheBuXy6YZBSAAaSyOQsX5JfXKwGuw8lus8OBrp2Y=;
        b=j2mI52BHHrzIbRftjRuOFjmt6QKNFTewfXe3GrmEur043HR7HaJpKjBWnpkf+5P1pZ
         9VAitweVEeewd5YjPQwmxH1lPZvLEHyI9dp2XhrTrDKF7rlximn7/b4SbdkvQxDaWv2S
         L0d5HLHpVBPzS09trMynYW76Qmc4e+oo9vyefil8SBCDIvCtTlwnzXTb8SB+or5o2FIX
         ot3qLfAzG1TM1ZnLbPjqqPlFSaZClXxPvbGZh4EuNotC4dBFM7Bz8JVeswL36gnacmAb
         +uLVn4B9lbAHzEBNJcMmqvyWvapPeTeUp3QA/QmQaUtuAi2DkV4MUqz2rxP6g7bzSGY/
         Rsjg==
X-Forwarded-Encrypted: i=1; AJvYcCVhkGMaLhAVe1NMeiaV6/KrxGFrmMNgPZQlrkQnkKp05IX9EyInFLAWpoJw6vx9HMxqVzMmhdLd2vx2pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzshPDAeqtfZMD9XGq+BKgRtC1OAJ9+OmhfHG+zE0E8jdGTFVyT
	25kkkP5Hl7JZijfoTeIv+kKucf8EJsx9H1EMLsAVPllag3QLkc62dKdo2zm5BmrZ2+Q=
X-Gm-Gg: ASbGncv1x267oheQafSS6arE1ECJ/kTwj/HaMLSTzXpzYmOfAadALxGURBSE9my7dnA
	OxRqXkuIvYXEyC1liF69bgeQVVv8fihuoJUdms6vowmM1eqFwB0gNThbVlo2UTYvnHVlGEYued+
	3EVnFg7ImJnB2aHNQDNfFYvscTu/hpsLtIvrP1yfNCwrhBfwrfjgo1QpZo8Q7DEmfnZUVXo3Ojh
	zP2LU9jls/7ToTFVDgJBGGtzw647VvZG0J1j+CD3dnhmIchWRX5Mo4WSXc3HqPGX9qq4Y5iKF4t
	p9o9CXYHMM8COuZ2O9guJCf727j34I1agBkV3xJsD5MZS2zwTDa23kuasFGuKWuVM4UFbyiMOFC
	aozY=
X-Google-Smtp-Source: AGHT+IE+3YuCeYJGJwDn+sNWhMGj764qlZlwHp5410p/o2A5QqpknTmv1v4Do0ZjuVRqdyPgQ/jIbQ==
X-Received: by 2002:a05:6830:2c0a:b0:72b:a9f0:50 with SMTP id 46e09a7af769-73afc57dacdmr7936452a34.6.1751299967924;
        Mon, 30 Jun 2025 09:12:47 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb0e47f8sm1717811a34.43.2025.06.30.09.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:12:47 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:12:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v2 2/3] media: mc: Add media jobs framework
Message-ID: <24a14a22-9798-420e-b515-87183e898137@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-media-jobs-v2-2-8e649b069a96@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/media-mc-entity-Add-pipeline_started-stopped-ops/20250624-160120
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250624-media-jobs-v2-2-8e649b069a96%40ideasonboard.com
patch subject: [PATCH v2 2/3] media: mc: Add media jobs framework
config: nios2-randconfig-r073-20250627 (https://download.01.org/0day-ci/archive/20250628/202506282351.uufwOAwG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506282351.uufwOAwG-lkp@intel.com/

New smatch warnings:
drivers/media/mc/mc-jobs.c:285 __media_jobs_run_jobs() error: we previously assumed 'step->run_step' could be null (see line 281)

vim +285 drivers/media/mc/mc-jobs.c

4be0a59bfc044b0 Daniel Scally 2025-06-24  257  static void __media_jobs_run_jobs(struct work_struct *work)
4be0a59bfc044b0 Daniel Scally 2025-06-24  258  {
4be0a59bfc044b0 Daniel Scally 2025-06-24  259  	struct media_job_scheduler *sched = container_of(work,
4be0a59bfc044b0 Daniel Scally 2025-06-24  260  							 struct media_job_scheduler,
4be0a59bfc044b0 Daniel Scally 2025-06-24  261  							 work);
4be0a59bfc044b0 Daniel Scally 2025-06-24  262  	struct media_job_step *step;
4be0a59bfc044b0 Daniel Scally 2025-06-24  263  	struct media_job *job;
4be0a59bfc044b0 Daniel Scally 2025-06-24  264  
4be0a59bfc044b0 Daniel Scally 2025-06-24  265  	while (true) {
4be0a59bfc044b0 Daniel Scally 2025-06-24  266  		scoped_guard(spinlock, &sched->lock) {
4be0a59bfc044b0 Daniel Scally 2025-06-24  267  			if (list_empty(&sched->queue))
4be0a59bfc044b0 Daniel Scally 2025-06-24  268  				return;
4be0a59bfc044b0 Daniel Scally 2025-06-24  269  
4be0a59bfc044b0 Daniel Scally 2025-06-24  270  			job = list_first_entry(&sched->queue, struct media_job,
4be0a59bfc044b0 Daniel Scally 2025-06-24  271  					       list);
4be0a59bfc044b0 Daniel Scally 2025-06-24  272  
4be0a59bfc044b0 Daniel Scally 2025-06-24  273  			list_del(&job->list);
4be0a59bfc044b0 Daniel Scally 2025-06-24  274  		}
4be0a59bfc044b0 Daniel Scally 2025-06-24  275  
4be0a59bfc044b0 Daniel Scally 2025-06-24  276  		list_for_each_entry(step, &job->steps, list) {
4be0a59bfc044b0 Daniel Scally 2025-06-24  277  			/*
4be0a59bfc044b0 Daniel Scally 2025-06-24  278  			 * Theoretically impossible as this should have been
4be0a59bfc044b0 Daniel Scally 2025-06-24  279  			 * validated in media_jobs_add_job_step()
4be0a59bfc044b0 Daniel Scally 2025-06-24  280  			 */
4be0a59bfc044b0 Daniel Scally 2025-06-24 @281  			if (!step->run_step)
4be0a59bfc044b0 Daniel Scally 2025-06-24  282  				WARN_ONCE(1, "%s(): No .run_step() operation\n",
4be0a59bfc044b0 Daniel Scally 2025-06-24  283  					  __func__);

We print a warning and then crash...  The NULL dereference
will have the same stack trace that the WARN_ONCE() does.

4be0a59bfc044b0 Daniel Scally 2025-06-24  284  
4be0a59bfc044b0 Daniel Scally 2025-06-24 @285  			step->run_step(step->data);
4be0a59bfc044b0 Daniel Scally 2025-06-24  286  		}
4be0a59bfc044b0 Daniel Scally 2025-06-24  287  
4be0a59bfc044b0 Daniel Scally 2025-06-24  288  		media_jobs_free_job(job);
4be0a59bfc044b0 Daniel Scally 2025-06-24  289  	}
4be0a59bfc044b0 Daniel Scally 2025-06-24  290  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


