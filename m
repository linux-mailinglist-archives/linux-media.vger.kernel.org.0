Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D122443E46A
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 16:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbhJ1PAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 11:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbhJ1PAq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 11:00:46 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28200C061767
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 07:58:19 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id na16-20020a17090b4c1000b0019f5bb661f9so4982917pjb.0
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 07:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QGXF5oWPYn5wMkU6IdsSHBlyLVAw8pj3F3Vqsyv9n4A=;
        b=P6eCMloWeqINUEj9ranXxT68xKyKG+nZeXgfOAjzUbfehAu/rt22mvQK6Cv6/wEVhf
         ILloehy+H3AmheBwCsJOWXj/ExWSGoUX7OnMiNGVroCNOp4k9Vgiy6/GMu5fFT6Zszgf
         KXJW6oVWAEOgw+nZb3EgWed+o32RfN8X4ovTA7EnWrvpelJNMO8xQoTFTMttXOUzUZwb
         0Xly/nYCzxtW3j12hxAVfUgxFKxGC5/vHAA21WJTYrU6D50yjoLIq2WotwRspD3zmaKZ
         masg4S+YLS4wCtzhqaBIf6crO0VS8UF0feqHXJVclVA/LnZwLrGD4PHQtvtjpiCHo8A/
         G3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QGXF5oWPYn5wMkU6IdsSHBlyLVAw8pj3F3Vqsyv9n4A=;
        b=rnwg2vpiJl12noTfttwG2Wuv3JAEhmgq8gifD8QRfMVqS+ImBVguYU7uBPn06XNPw+
         0I3Ub21SRRy3jDrI4DFid2hD1nhdW8uBa5ki5Xz1luvWa/J0mbW0ADwfdqSAdR1AzY8Q
         dqS7EpgV+ytASSW+1d4nPxe7PQY4zoDWJkTnEwdDiT2ca3/qVKTyQjdjIEa5zP4hpTNK
         T6HsOyZ0XO87M8BFV0qUW4kV7UWE/SJQ2xRDAxlRTsGrjw088ymFOFdCYtjer54unqtf
         J+5blMHpTX8OJsG9GY/0d/Nb8bOdr/QFJw1TmYquKWJWOBgzY8mGCpWV3B7Vsh5g3pxH
         /s6A==
X-Gm-Message-State: AOAM530QkCUSxZu8o2CSipnMXqKRTAStkLtvcWUS0Qo4iHgso48ODzPl
        n2G8MKLyVg+68N4xDlCRk66hcg==
X-Google-Smtp-Source: ABdhPJzktVilKhrXQKOyuMENgwV5ET+AbhuNqDf8NyijYHCTVEjAfRDleaAvbK/MY9xZIowkHZVQMA==
X-Received: by 2002:a17:90b:388a:: with SMTP id mu10mr5243207pjb.0.1635433098398;
        Thu, 28 Oct 2021 07:58:18 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id m10sm8036396pjs.21.2021.10.28.07.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 07:58:17 -0700 (PDT)
Date:   Thu, 28 Oct 2021 14:58:13 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     syzbot <syzbot+05017ad275a64a3246f8@syzkaller.appspotmail.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, bhelgaas@google.com,
        bp@alien8.de, dave.hansen@linux.intel.com,
        devel@driverdev.osuosl.org, f.fainelli@gmail.com,
        gregkh@linuxfoundation.org, hpa@zytor.com,
        info@cestasdeplastico.com, jmattson@google.com, joro@8bytes.org,
        kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pci@vger.kernel.org,
        linux-rpi-kernel-owner@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, lorenzo.pieralisi@arm.com,
        mchehab@kernel.org, mingo@redhat.com, nsaenzjulienne@suse.de,
        pbonzini@redhat.com, robh@kernel.org,
        sean.j.christopherson@intel.com, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com, tcs_kernel@tencent.com,
        tglx@linutronix.de, vkuznets@redhat.com, wanpengli@tencent.com,
        x86@kernel.org
Subject: Re: [syzbot] BUG: spinlock bad magic in synchronize_srcu
Message-ID: <YXq6hTAOhOaWGsNA@google.com>
References: <0000000000000f73a805afeb9be8@google.com>
 <000000000000792dda05cf604775@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000792dda05cf604775@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 27, 2021, syzbot wrote:
> syzbot suspects this issue was fixed by commit:
> 
> commit eb7511bf9182292ef1df1082d23039e856d1ddfb
> Author: Haimin Zhang <tcs_kernel@tencent.com>
> Date:   Fri Sep 3 02:37:06 2021 +0000
> 
>     KVM: x86: Handle SRCU initialization failure during page track init
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=143e2b02b00000
> start commit:   78e709522d2c Merge tag 'for_linus' of git://git.kernel.org..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2150ebd7e72fa695
> dashboard link: https://syzkaller.appspot.com/bug?extid=05017ad275a64a3246f8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b72895300000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14c42853300000
> 
> If the result looks correct, please mark the issue as fixed by replying with:
> 
> #syz fix: KVM: x86: Handle SRCU initialization failure during page track init

#syz fix: KVM: x86: Handle SRCU initialization failure during page track init
