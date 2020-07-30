Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B079A232BEC
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 08:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbgG3G2c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 02:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgG3G2c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 02:28:32 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFF8C061794
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 23:28:32 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id z5so15975239pgb.6
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 23:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D41WgpnYtOz3in7kEhZhl5y4lcXdRV4ox/tlN54nJNI=;
        b=hr8wwJraR+oqHIi9elajfFVS4iFi4QjLXvCKpxyqOKSQUSnFSuiQy7WNAQSxd308EE
         4c0+3AwfvXegp9nw/gpnadKzg5PNze0WVkofC71YX07xH/ufqLZ8mP2nILg3mmpVgp1J
         Ck5Oje7fZcSOf1tVqyzVPjSdePD3I9rGhQs1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D41WgpnYtOz3in7kEhZhl5y4lcXdRV4ox/tlN54nJNI=;
        b=OMnPTHjt4XBPSjrIpYC0xnu7bBIOCFTH7k3GO+GbB6p6sYaLMsgdiGNdTsAgDCEA/R
         eHEVQNPN8ZFjAknrO8YorxkR1Xevfkl7q5HzQflmIFhVsRmpwYGtReZ+/xfpBFcD1cCE
         ueKBiLJ8CTDuBcS4P4E1XfTHmXxw+2PdTC3NK5tmE+VrvFUimEjfwdXK2usBmBeuxJ8n
         eqerGotKRSO4DCCvdKduScpTgAqEy3tOZHS+0bYp45iVqTzisLTDj76admuvSrxAblTm
         y/JI0PDrNG17PvHJI5fM9CJgUY/FJFTyFSLl/ZjtCRONDnTKFAOVMscN0FffCQZtmRiH
         hecQ==
X-Gm-Message-State: AOAM530ltKcs/jfyXbyl6cgGMdzHuAsQaQjv1sdW1ClPmBJ7u2/ku2Zn
        MnbiG+SUVub/sROw5B1VR23+pA==
X-Google-Smtp-Source: ABdhPJzL2/tV1l7QjpXdufwuW8/C0Sh2HhXsjvgFAfi+YIDob2E3Z+vRZTMMIteiqQ0O1sR8nmEjUA==
X-Received: by 2002:a62:1bc6:: with SMTP id b189mr1757530pfb.150.1596090511720;
        Wed, 29 Jul 2020 23:28:31 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
        by smtp.gmail.com with ESMTPSA id d22sm4691135pfd.42.2020.07.29.23.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 23:28:31 -0700 (PDT)
Date:   Thu, 30 Jul 2020 15:28:29 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        senozhatsky@chromium.org, bingbu.cao@linux.intel.com,
        qingwu.zhang@intel.com
Subject: Re: [PATCH v2] media: i2c: ov2740: get OTP data ready before nvmem
 registration
Message-ID: <20200730062829.GA2949706@google.com>
References: <1595562338-11864-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595562338-11864-1-git-send-email-bingbu.cao@intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/07/24 11:45), Bingbu Cao wrote:
> The OTP data was not ready after registered as nvmem device, it is
> risky as the nvmem read may happen once the device exists, this patch
> get the OTP data ready before registering the nvmem device. OTP data
> missing should not break the normal camera sensor probe, so use a
> warning instead of an error message.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Qingwu Zhang <qingwu.zhang@intel.com>
> Suggested-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

	-ss
