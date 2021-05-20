Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19AD38B38F
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 17:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240674AbhETPtN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 11:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbhETPtM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 11:49:12 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90259C06175F
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 08:47:50 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id n6-20020a17090ac686b029015d2f7aeea8so5671735pjt.1
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 08:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TbJQOEEFF/+nf1KiXSLwJcY/vwU+LRKGaCo1IHQgEHk=;
        b=nc9d59urRD2gADVZIakW9AaJC1C5aS/uZY9a449dXEeqz33LeD3zgBoFymK/FFzx9W
         8UMLGr5qQ1Opl1RnjvIZ6C9oBra3dAeV44x+HMZgRPUb+HQxs2/27kS9SCrLMM42SsDE
         FnSSqxYyqy07U4oIZlH9vBaexa9vFQtM+SZTp7/kQtYKYom/1FojUrbkRlk0cziddX39
         IGt7QouHuVRYLfDXlip7ZuNP1HLcDP81qreveh8VZWPPjps1Jj5vRA50bDfk6i4vB5i2
         zn6rIuJFLxJvM/AgFYkEAL2phrdzLXl7hqu0s45hITCo4o2Y7zUpaoplgH8O2oPD0QtS
         ltMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TbJQOEEFF/+nf1KiXSLwJcY/vwU+LRKGaCo1IHQgEHk=;
        b=n/NCxj11zsJb9+zJQ5QFVAPEbqiD8krTYj+NLEtZ3lI4VeNRszDwD7+3aDUCiVzRWF
         wO0VQyir2WuqvqQ+qUh7wnMDyeleDWTVlVOH/KOAl7YNicy8529afC4b1c3b2NdBJBiO
         XHEwAJEZ8b0j9yxVLN5NCtbl1ulCd5wa+jGIW/zALcaGpn4XTxPVyznj7VbtmjystuNX
         YjI0Hj0Ur9orfIM0koB1K5VBzcz330G2zzRdUgGSmjLRDDUwExJxVlMnd/Yi12zonJrD
         zXE3ISgSUtqbHfvBFvGC5pCfApHkZocUXKnUl1YDytnjwt4qnf6fFGfjfXcvsaFGp1pt
         3x0g==
X-Gm-Message-State: AOAM533wnGcrMrN6qpfStgUPBPxwqWLT9oVC8Q2QW+xFGDUecc8jOaOU
        dclfDKT9HVoswzvqXltw2opw7Q==
X-Google-Smtp-Source: ABdhPJxTM/jRG6LA6ksVCqvmEyYOIRv/ZFqP16D9FpSI6ufCXuMAETXrh9UrMjmvWOGKuc+j4Z/ITw==
X-Received: by 2002:a17:90b:1902:: with SMTP id mp2mr5550488pjb.176.1621525669947;
        Thu, 20 May 2021 08:47:49 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com. [35.247.111.240])
        by smtp.gmail.com with ESMTPSA id c191sm2278922pfc.94.2021.05.20.08.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 08:47:49 -0700 (PDT)
Date:   Thu, 20 May 2021 15:47:46 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Joe Richey <joerichey94@gmail.com>
Cc:     trivial@kernel.org, Joe Richey <joerichey@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Zhangfei Gao <zhangfei.gao@linaro.org>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-accelerators@lists.ozlabs.org
Subject: Re: [PATCH 0/6] Don't use BIT() macro in UAPI headers
Message-ID: <YKaEov7nKBFjtRXu@google.com>
References: <20210520104343.317119-1-joerichey94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520104343.317119-1-joerichey94@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 20, 2021, Joe Richey wrote:
> From: Joe Richey <joerichey@google.com>
> 
> The BIT(n) macro is used in the kernel as an alias for (1 << n).
> However, it is not defined in the UAPI headers, which means that any
> UAPI header files must be careful not to use it, or else the user
> will get a linker error. For example, compiling the following program:
> 
>     #include <sys/auxv.h>
>     #include <asm/hwcap2.h>
> 
>     // Detect if FSGSBASE instructions are enabled
>     int main() {
>         unsigned long val = getauxval(AT_HWCAP2);
>         return !(val & HWCAP2_FSGSBASE);
>     }
> 
> Results in the following likner error:
> 
>     /usr/bin/ld: /tmp/cceFpAdR.o: in function `main':
>     gs.c:(.text+0x21): undefined reference to `BIT'
> 
> This patch series changes all UAPI uses of BIT() to just be open-coded.
> However, there really should be a check for this in checkpatch.pl

Any reason not to provide such a patch in this series?  :-)

> Currently, the script actually _encourages_ users to use the BIT macro
> even if adding things to UAPI.
> 
> Running `rg "BIT\(" **/uapi/**` shows no more usage of BIT() in any
> UAPI headers. Tested by building a basic kernel. Changes are trivial.
