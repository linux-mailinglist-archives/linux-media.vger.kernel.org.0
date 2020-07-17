Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A32EB2232A9
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 06:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgGQE6Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 00:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgGQE6P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 00:58:15 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CA8C061755;
        Thu, 16 Jul 2020 21:58:15 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id md7so5822315pjb.1;
        Thu, 16 Jul 2020 21:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/oRewgFvGaQNev9gG1TOwBh1zMOVWvkQU1IczbGLRlU=;
        b=ABckm4CpOvOAqCXeBoOfCRPNvFAJZ1k5Q6gt189Y4Jj35kUkZY9yVoVjIS/aGTs6hs
         zDtFsDNyoOQBBgOnbkm2jJuMtPFZ1Inl/usiDSDEqA1bvmln+9PO2mkYkihgHzd1iT1Y
         spIav2nhi7UrMn1MoITUnQ6b2WbjnG0ndojUfCm0Sv7hmtSVVvD40mzBbIUa2wDHvYaW
         p9wqURCA+BrZA5/h39vhFHIa5QR7Um0ao5dOIYgBWSH5pAKtl3M0JM+WUCioGkc51lms
         n8sIHWOU3t/9IaPI9qpnjxd1ICheZHVslJB8IKs7b5o1CRe9alAC3rud/HEmgP+En/EI
         udcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/oRewgFvGaQNev9gG1TOwBh1zMOVWvkQU1IczbGLRlU=;
        b=DBqLrmIw2K2XbVFiQ17/cZpogbUJAXUC+z68K9/Sc1glowvtxNPQC3hH0Xdn8LL18u
         PvhwgJjZMgH2In9YV2f+oMv1EtNxKyqCdEpLat69O6sT1BsGyvejhsySKkXQDCKADB9n
         xEgqQKoGjyxBd/xbbIRJyE0qIin+Sc0OOZ33+NHBBI48e53J2kZCLkILOKfRjamwYyre
         Y3D6Q14BS63oauZoNUjaAv1qMG8WNZZRYSb37LLQNVPhmmeXM0o9TbRyaEGSnaTq6lOL
         M6zRCoRgrRZy6pQI+bssdNwZdJLCr1gbWk6FkqoN57m945fDMMnWFw85rTfpIAPFnewF
         fFRw==
X-Gm-Message-State: AOAM533ZYgSF8lCazC6nbYPC7nrAEE2bI+PhIWzp2UVfWgrjAx1Cp961
        n3Bj5zvDwfUHs0cpuBjZb90=
X-Google-Smtp-Source: ABdhPJwlUOr9sLF55zh5BAYeD7nEIBP9B8lwtG4fd7pQmfdqi60iR1n2G7y3RrbmuZf18vKaMpHfCA==
X-Received: by 2002:a17:902:9890:: with SMTP id s16mr3666000plp.112.1594961895145;
        Thu, 16 Jul 2020 21:58:15 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id m3sm6498708pfk.171.2020.07.16.21.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 21:58:14 -0700 (PDT)
Date:   Fri, 17 Jul 2020 10:26:48 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 0/6] [media] pci: use generic power management
Message-ID: <20200717045648.GA121727@gmail.com>
References: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 17, 2020 at 09:26:02AM +0530, Vaibhav Gupta wrote:
> Linux Kernel Mentee: Remove Legacy Power Management.
> 
> The purpose of this patch series is to upgrade power management in media
> drivers. This has been done by upgrading .suspend() and .resume() callbacks.
> 
> The upgrade makes sure that the involvement of PCI Core does not change the
> order of operations executed in a driver. Thus, does not change its behavior.
> 
> In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
> helper functions like pci_enable/disable_device_mem(), pci_set_power_state(),
> pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
> their job.
> 
> The conversion requires the removal of those function calls, change the
> callbacks' definition accordingly and make use of dev_pm_ops structure.
> 
> v2: v1 possibly broke cx23885 and cx25821.
v1 didn't break anything in real as patch was not applied. But it could have.
> 
> All patches are compile-tested only.
> 
> Test tools:
>     - Compiler: gcc (GCC) 10.1.0
>     - allmodconfig build: make -j$(nproc) W=1 all
> 
> Vaibhav Gupta (6):
>   sta2x11: use generic power management
>   cx23885: use generic power management
>   cx25821: use generic power management
>   cx88: use generic power management
>   meye: use generic power management
>   tw68: use generic power management
> 
>  drivers/media/pci/cx23885/cx23885-core.c |  3 --
>  drivers/media/pci/cx25821/cx25821-core.c |  3 --
>  drivers/media/pci/cx88/cx88-video.c      | 52 +++++--------------
>  drivers/media/pci/meye/meye.c            | 15 ++----
>  drivers/media/pci/sta2x11/sta2x11_vip.c  | 63 ++++++------------------
>  drivers/media/pci/tw68/tw68-core.c       | 30 +++++------
>  6 files changed, 44 insertions(+), 122 deletions(-)
> 
> -- 
> 2.27.0
> 
