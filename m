Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4499A566677
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 11:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbiGEJqd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 05:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbiGEJqb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 05:46:31 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49533F21
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 02:46:25 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id q8so1371615ljj.10
        for <linux-media@vger.kernel.org>; Tue, 05 Jul 2022 02:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=O6MEO0JJbH7cz1Tl/SAwZ8G+cePN006H4WF8z0ANT+4=;
        b=NsdgOMMefg43xzXySytXzkaOWCiQDywgfKaxVtTOXWljFe1QM2Vue7LPhe/noCUGy/
         R8tBksN4d2w/5gc0Xk7yG74rdp/JjJjRBsmgLCJE46L/85wk+4Mb5IFd9BwOJw8V5uGE
         X7KcVNKU0dHBhhUO0ndIOmpMYFr8Mh9MvNtVweBYfGpPDNb8ekoepuUBGpsqHNuqfgwD
         HCEDpSIOzZoexUSQqT1S5cZ5+6MdO+F0gpc71nwcZDfpgwz+6DM5niX8sdvFbtwmxH0N
         DqfmvnUOrFdmrrGngPj5ubuntSNIAqLaw3w5vTCGlO1oGsuGyiZATKT4ZOMs659ciMTc
         pBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=O6MEO0JJbH7cz1Tl/SAwZ8G+cePN006H4WF8z0ANT+4=;
        b=b3MvyGen34uUgllpl6I0kktVU9vcymogkkVy6FGIc2ruvZMUQZBjzN4129MRMfxNdG
         t5mMJ41AdLBamcH7b7RIV+R2caponbYpJoOpvvIgkPS5Vx0Y6IN9yLQEqSMVVu09qxCi
         UBp3+mNSRDMjud+A02MD27Mof8oVWaAvZYFGWVpO42Qr9+PzCM0gbiXNbablA39/6EqO
         +cb3cZg0q8UZVJzJfnNknzvZfjIkLKzd4fkiuxTYg6VszQD6UAiCWT4AA2Ap+0qhtUHo
         RphZYDQA9vMUWBsEBJ9dFQhQJ7Eh1p4ckeo9myjLcBGetKc2J8kLHeMckO23ldxZ10h9
         Zr5g==
X-Gm-Message-State: AJIora/sBLjsPdO3ovJcoze7LCbP/UVuzPiK9s/0Y6ktwi1eCjlG/sno
        aNTiNM9dseF3WtPniyhLkgYx/BuwdUfV/A==
X-Google-Smtp-Source: AGRyM1s1YEvSwgqBA7P2+jN0DTKVnOPIdB7UmJd1sQu71vpyLv5nhiZHutfVP5lF9/LVMKHz1Dy1TA==
X-Received: by 2002:a2e:bc0b:0:b0:25a:89a6:8370 with SMTP id b11-20020a2ebc0b000000b0025a89a68370mr18400483ljf.262.1657014383897;
        Tue, 05 Jul 2022 02:46:23 -0700 (PDT)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id d10-20020ac24c8a000000b0048313e26b95sm429857lfl.130.2022.07.05.02.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:46:23 -0700 (PDT)
Date:   Tue, 5 Jul 2022 11:46:22 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Michael Rodin <mrodin@de.adit-jv.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, michael@rodin.online,
        erosca@de.adit-jv.com
Subject: Re: [PATCH v2 0/3] Improve error handling in the rcar-vin driver
Message-ID: <YsQIbr9QYGBDoIWT@oden.dyn.berto.se>
References: <YqEO3/KekkZhVjW+@oden.dyn.berto.se>
 <20220628180024.451258-1-mrodin@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628180024.451258-1-mrodin@de.adit-jv.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thanks for your persistent work with this series.

On 2022-06-28 20:00:19 +0200, Michael Rodin wrote:
> Hello,
> 
> this series is a followup to the other series [1] started by Niklas S�derlund
> where only the first patch has been merged. The overall idea is to be more
> compliant with the Renesas hardware manual which requires a reset or stop
> of capture in the VIN module before reset of CSI2. Another goal is to be
> more resilient with respect to non-critical CSI2 errors so the driver does
> not end in an endless restart loop. Compared to the previous version [2] of
> this series the patch 3 is replaced based on the conclusion in [3] so now
> userspace has to take care of figuring out if a transfer error was harmless
> or unrecoverable. Other patches are adapted accordingly so no assumptions
> about criticality of transfer errors are made in the kernel and the
> decision is left up to userspace.

I like this solution as it truly pushes the decision to user-space. What 
bugs me a little bit is that we don't have a way to communicate errors 
that we know are unrecoverable (it was for this case the work in this 
area started) and ones that could be recoverable (the use-case added on 
top).

I would also like to hear what Hans thinks as he had good suggestions 
for how to handle the cases we know can't be recovers in [4].

> 
> [1] https://lore.kernel.org/linux-renesas-soc/20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se/
> [2] https://lore.kernel.org/all/1652983210-1194-1-git-send-email-mrodin@de.adit-jv.com/
> [3] https://lore.kernel.org/all/YqEO3%2FKekkZhVjW+@oden.dyn.berto.se/

4. https://lore.kernel.org/all/1fddc966-5a23-63b4-185e-c17aa6d65b54@xs4all.nl/

-- 
Kind Regards,
Niklas S�derlund
