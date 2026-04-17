Return-Path: <linux-media+bounces-58979-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBRcCyX04Wmv0AAAu9opvQ
	(envelope-from <linux-media+bounces-58979-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:49:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF67418ED4
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0946430EE6A2
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486B13B0AEE;
	Fri, 17 Apr 2026 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJbJf/e+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520252C3252
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415617; cv=none; b=TMyPMMHy2IsfVbHO6A+rkUp3b6u7+cOr+Nbg+IggpKRCgiLaaPAksW/+glwyTbPfngI9SEbe1NHpoP40Zk53Hv/HmQ4SAYdRjxUKYe61u2Ho5puCbfOCetLqpqcR+ufa1FDzyQXZ8fc2cot8J8nCL221Ghqm8rJ6sPNWpTnYTyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415617; c=relaxed/simple;
	bh=iIvafjuXfztxFfgcKs7kT5RlkaNQ9IadaQjo27I+9nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFn0oa3o6Wc1vAZdo9FL6sN4kR38DWuztXhamVNmILg2xltcWdozas+jJFyWvcYYp+GqNiaU9i2ZoV1s5pwK0NV2nju5PxFX+CNSbg7E93rZbcfi4eT61KykMt7uIrJwEJ6wIRCk7wOVn7rcMIBpSQrUF6p7vgmXc+lMcqNwRn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJbJf/e+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43eada6d900so389336f8f.0
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 01:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776415615; x=1777020415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zBkw927Ld/haKLI1V+/hgl3xfnjSiKFGGzIAYEm2H3E=;
        b=GJbJf/e+J5/BKeIc0SZIE6YLpb6BpqI5gfUur4M9tHr3VSNT3g/70jpQmyl5ratV9G
         6J+CnCMiLV0Ov1qmKd1tOoxhB/aCI0GCcXm2X6uwcG/byYWybwwKx3f1tF01R6mZaxCg
         LYWh5b3O2WGHmz+CnNHFs3tVR54WSrlkFgjM6BIqyu0VEdGJx8lJfgpOPqL3zhEWgc4h
         SLREpwbvqHNeCBOaT6LMxnxfOftLVC0mw8/hC6DeBCEwkgfV9awkKzqiSm+gBcgvx9aa
         LbUpLrK/abH4WK18b9SMxAErqQ0R5Y3YaVQVY1ArV0+QmTRddR3sDlyuAFXOAwYYa1xX
         6VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776415615; x=1777020415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBkw927Ld/haKLI1V+/hgl3xfnjSiKFGGzIAYEm2H3E=;
        b=fkg8I4r1gFnv1n1SrXMi0KVMG3r1wlyfPs+eVOsJJT2/tchFrEwKhD8whiFj4WtKqS
         3GfNYrVmx2Z/iv4djkvOsluZmLYUMZLRshVg2nWy0wQBsWU9wGpdVFqEe/kJMui+aVFX
         yMmI0Qyc4WBeOefbbryRE6PdC/JfyEDaljqJLXekELTML1x5CAWsiRDqvEh9rGtJA6Fw
         FIDvhquIJn/eick5Zbq+UHuxNW1mbY/TfIcBZpfaFdEqj2zkWScgbEHWpdYj32s4rE7A
         awimh5lT1+1KkJYrnNczOR9uiyqpY4vz4iPHSPxJzb06DO2rlCosghuOYnxJzuJ5KdqD
         CAGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9F+9FQRtIpcLFYFiG3IYvMEdPNJLsQaDK5EB/fnlIp8VjhSvEJQWJmnOkTxtbVPdky0fHgX6admCv3zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNvIV10d7FV3vetdMflJUnDkIcaAw9Bv6lvkpzEIKlq/bc/yYN
	iZHlx/V+vShesDrYQUTyYGOGFosWs5djfqx5ebOc/2u17Fy8TCm5rQxl
X-Gm-Gg: AeBDieuvbtPKWoS5UfONOZgN4QMtXWqfS19kNyU2lFeajoKdsr7SEfGCxFztUvTVyZy
	je/PWpp5/HAgWbQ12ye56zbJpH6fGHigH76/+Bcg4nh+RQH2SFcjHE+wE8LtOR5rLXZ+l47AUqr
	8SFUWh0mIK5TWUJJJF3N3+mf8LVT2GMPxhxQ6twFQb4sKQiFhKnCF1poGbjiQOJGOp1d7IEqgDE
	okpBvYxkrvN4S/sv2uu5ZxmS5HG/X71kR2cpq2x6+i3MLo32yeZAVShP1ZIhaKwoeH0L3kPaRuf
	qxsT6erLQuJ9YM8CxHWWTuqfEZlc/QmmsnFH7GgQUs0QnGHXI8EdnMIs9spuaoKnW/tMN7i8wMT
	9mY8I53MhTNZY948D9r3Sxn3g8E50ow3dRcS9DwSqiJ+QQ9+oWa97/pwmTkBYTHONJgYTRTcUeQ
	HI/DMnaiVNkUXuAI+1aHPuF27kXrAfvg==
X-Received: by 2002:a05:6000:2888:b0:43d:7b23:bc99 with SMTP id ffacd0b85a97d-43fe3dc8152mr2704121f8f.15.1776415614610;
        Fri, 17 Apr 2026 01:46:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4ffa8sm2701731f8f.35.2026.04.17.01.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:46:53 -0700 (PDT)
Date: Fri, 17 Apr 2026 11:46:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu7: fix boot_config leak on
 queue_mem failure
Message-ID: <aeHzeuVMpcaPx6_x@stanley.mountain>
References: <20260416074800.2493565-1-hhhuang@smu.edu.sg>
 <20260417073939.2686170-1-hhhuang@smu.edu.sg>
 <aeHo2WOF1Rcp9zwf@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeHo2WOF1Rcp9zwf@stanley.mountain>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58979-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8DF67418ED4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 11:01:29AM +0300, Dan Carpenter wrote:
> I haven't looked at this but I bet there are bugs in the error handling
> since magical cleanup functions are always buggy.

The error handling in ipu7_fw_isys_init() is frustrating to review but
it works fine.

Imagine that someone were writing this error handling methodically, using
a normal unwind ladder.
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

drivers/staging/media/ipu7/ipu7-fw-isys.c 
    81  int ipu7_fw_isys_init(struct ipu7_isys *isys)
    82  {
    83          struct syscom_queue_config *queue_configs;
    84          struct ipu7_bus_device *adev = isys->adev;
    85          struct device *dev = &adev->auxdev.dev;
    86          struct ipu7_insys_config *isys_config;
    87          struct ipu7_syscom_context *syscom;
    88          dma_addr_t isys_config_dma_addr;
    89          unsigned int i, num_queues;
    90          u32 freq;
    91          u8 major;
    92          int ret;
    93  
    94          /* Allocate and init syscom context. */
    95          syscom = devm_kzalloc(dev, sizeof(struct ipu7_syscom_context),
    96                                GFP_KERNEL);
    97          if (!syscom)
    98                  return -ENOMEM;

This is our first resource.  It's allocated with devm_ so we don't need
to free it.  Nothing to free.

    99  
   100          adev->syscom = syscom;
   101          syscom->num_input_queues = IPU_INSYS_MAX_INPUT_QUEUES;
   102          syscom->num_output_queues = IPU_INSYS_MAX_OUTPUT_QUEUES;
   103          num_queues = syscom->num_input_queues + syscom->num_output_queues;
   104          queue_configs = devm_kzalloc(dev, FW_QUEUE_CONFIG_SIZE(num_queues),
   105                                       GFP_KERNEL);

This is our second resource.  Still devm_.  Still nothing to free.

   106          if (!queue_configs) {
   107                  ipu7_fw_isys_release(isys);

And yet we call ipu7_fw_isys_release().  Fortunately it's a no-op.

   108                  return -ENOMEM;
   109          }
   110          syscom->queue_configs = queue_configs;
   111          queue_configs[IPU_INSYS_OUTPUT_MSG_QUEUE].max_capacity =
   112                  IPU_ISYS_SIZE_RECV_QUEUE;
   113          queue_configs[IPU_INSYS_OUTPUT_MSG_QUEUE].token_size_in_bytes =
   114                  sizeof(struct ipu7_insys_resp);
   115          queue_configs[IPU_INSYS_OUTPUT_LOG_QUEUE].max_capacity =
   116                  IPU_ISYS_SIZE_LOG_QUEUE;
   117          queue_configs[IPU_INSYS_OUTPUT_LOG_QUEUE].token_size_in_bytes =
   118                  sizeof(struct ipu7_insys_resp);
   119          queue_configs[IPU_INSYS_OUTPUT_RESERVED_QUEUE].max_capacity = 0;
   120          queue_configs[IPU_INSYS_OUTPUT_RESERVED_QUEUE].token_size_in_bytes = 0;
   121  
   122          queue_configs[IPU_INSYS_INPUT_DEV_QUEUE].max_capacity =
   123                  IPU_ISYS_MAX_STREAMS;
   124          queue_configs[IPU_INSYS_INPUT_DEV_QUEUE].token_size_in_bytes =
   125                  sizeof(struct ipu7_insys_send_queue_token);
   126  
   127          for (i = IPU_INSYS_INPUT_MSG_QUEUE; i < num_queues; i++) {
   128                  queue_configs[i].max_capacity = IPU_ISYS_SIZE_SEND_QUEUE;
   129                  queue_configs[i].token_size_in_bytes =
   130                          sizeof(struct ipu7_insys_send_queue_token);
   131          }
   132  
   133          /* Allocate ISYS subsys config. */
   134          isys_config = ipu7_dma_alloc(adev, sizeof(struct ipu7_insys_config),
   135                                       &isys_config_dma_addr, GFP_KERNEL, 0);
   136          if (!isys_config) {
   137                  dev_err(dev, "Failed to allocate isys subsys config.\n");
   138                  ipu7_fw_isys_release(isys);

Still nothing to free.  This is still a no-op.

   139                  return -ENOMEM;
   140          }
   141          isys->subsys_config = isys_config;

isys->subsys_config is our first resource that we have to free.

   142          isys->subsys_config_dma_addr = isys_config_dma_addr;
   143          memset(isys_config, 0, sizeof(struct ipu7_insys_config));
   144          isys_config->logger_config.use_source_severity = 0;
   145          isys_config->logger_config.use_channels_enable_bitmask = 1;
   146          isys_config->logger_config.channels_enable_bitmask =
   147                  LOGGER_CONFIG_CHANNEL_ENABLE_SYSCOM_BITMASK;
   148          isys_config->logger_config.hw_printf_buffer_base_addr = 0U;
   149          isys_config->logger_config.hw_printf_buffer_size_bytes = 0U;
   150          isys_config->wdt_config.wdt_timer1_us = 0;
   151          isys_config->wdt_config.wdt_timer2_us = 0;
   152          ret = ipu_buttress_get_isys_freq(adev->isp, &freq);

This doesn't allocate anything, but we would need to free
isys->subsys_config.  Ideally, we would have a goto free_subsys_config;
here.

   153          if (ret) {
   154                  dev_err(dev, "Failed to get ISYS frequency.\n");
   155                  ipu7_fw_isys_release(isys);

But this does free isys->subsys_config.  Good.

   156                  return ret;
   157          }
   158  
   159          ipu7_dma_sync_single(adev, isys_config_dma_addr,
   160                               sizeof(struct ipu7_insys_config));
   161  
   162          major = is_ipu8(adev->isp->hw_ver) ? 2U : 1U;
   163          ret = ipu7_boot_init_boot_config(adev, queue_configs, num_queues,
   164                                           freq, isys_config_dma_addr, major);

This allocates one or both of syscom->queue_mem and adev->boot_config.
Ideally it would clean up partial allocations and we would do the same
goto free_subsys_config; here.

   165          if (ret)
   166                  ipu7_fw_isys_release(isys);

But this does free them along with isys->subsys_config.  Everything
works.

   167  
   168          return ret;
   169  }

regards,
dan carpenter


