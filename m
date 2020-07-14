Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8697B21EE63
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 12:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbgGNKy0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 06:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgGNKyZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 06:54:25 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E42C061755;
        Tue, 14 Jul 2020 03:54:25 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x9so6879826plr.2;
        Tue, 14 Jul 2020 03:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KLbw3IbcrAXc8QouI0Bu7vFi8chhw+Ci6U+9y5k9Blc=;
        b=lE9u4VMLUxfwNTkRBiprv6dokWrJVjtKXiRnrU6P9O+8tygFUhLocZMypfx2Mlhy/j
         9G7cWav9fC5RST46LWUTZFny/hGE4UtULyRSyT+F7AEja24kGYLnRkDH5kAPu/7QwXW2
         NxKNZSR1mwxZvXUYMQdT2aQQFbzJSwqoItizQWcg9Dqz/On1W7H4uXtrXK5Jn04lapnM
         rVsSWXX9/ecM8EKNAClLo/JWxWak4bFjTnOXbrWemEQv5rrT51b0BIBqiMzhjX33NmeT
         DP0w5zQErt6EJDcATI4cavAG75gRX+5EtrxuVf9CpBeK5EHoqPijRyMR4W1QKkx9pgeh
         2zBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KLbw3IbcrAXc8QouI0Bu7vFi8chhw+Ci6U+9y5k9Blc=;
        b=DFqWiYYxljRPPBjHAwNYa+THfwvX+Yy9J8W86LPLjWjdRb6TdsyZZpVrMcf6hbhrkS
         k9Yne92W6XEama4wJCsSRo4Vo8VbB1CG7VHpHZIsIajIFd1ZWfARRgqHB+lyEfg3+349
         /WeG0DUZUJ+c9opjWeYALH2NKzOvFSIWT/jzslGV1SaCU1sWGfrKL8tDBxUvsYGHgtzf
         6n8YvTMC7nLs/6N5EO1OefXZll9EcwRgQLv5ZLKlrUiSPydxYR6wtBZA5mmXx/AeI8vI
         W0mIHhDgDqR7ceiQPpq8pk2OiuG3xkCheFyJbeDT6mvjQZd0JEnwv260ju4MsKgGv6M7
         /vbw==
X-Gm-Message-State: AOAM530Tc0LYAJ1bPvleYToeugWj/kYXNAPyfllbAT0opUxZuy7Sv/6y
        NktOCjKT5/c4MDR6LndLLQM=
X-Google-Smtp-Source: ABdhPJzhPpBbGGdNyT0x4RlIw4eIAqM0zMbmAew4wvCnGbD4Fe9H5R+7gdYAv5/8yH6Mm/485GOVcw==
X-Received: by 2002:a17:902:b706:: with SMTP id d6mr3405237pls.244.1594724065125;
        Tue, 14 Jul 2020 03:54:25 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id oc6sm2313921pjb.43.2020.07.14.03.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 03:54:24 -0700 (PDT)
Date:   Tue, 14 Jul 2020 16:22:59 +0530
From:   Vaibhav Gupta <vaibhav.varodek@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>, bjorn@helgaas.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org
Subject: Re: [PATCH v1 2/6] [media] cx23885: use generic power management
Message-ID: <20200714105259.GA1792@gmail.com>
References: <c4a46846-208f-c834-56d7-02543c395795@xs4all.nl>
 <20200714003814.GA292013@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200714003814.GA292013@bjorn-Precision-5520>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 13, 2020 at 07:38:14PM -0500, Bjorn Helgaas wrote:
> On Mon, Jul 13, 2020 at 12:01:51PM +0200, Hans Verkuil wrote:
> > On 29/06/2020 09:36, Vaibhav Gupta wrote:
> > 
> > I don't entirely understand this. Wouldn't it be sufficient to just
> > drop the .suspend/.resume assignments here? It is now required for
> > driver.pm to be non-NULL?
> > 
> > I'm not up to speed on the changes, but normally you can leave things
> > NULL if you don't support a feature (PM in this case).
> 
> I think this patch will break things.  Previously, we had:
> 
>   cx23885_pci_driver.suspend == NULL
>   cx23885_pci_driver.resume == NULL
>   cx23885_pci_driver.driver.pm == NULL
> 
> pci_pm_suspend() looks like:
> 
>   if (pci_has_legacy_pm_support(pci_dev))
>     return pci_legacy_suspend(dev, PMSG_SUSPEND);
> 
>   if (!pm) {
>     pci_pm_default_suspend(pci_dev);
>     return 0;
>   }
> 
> pci_has_legacy_pm_support() was false since drv->suspend and
> drv->resume are both NULL, so we'd take the pci_pm_default_suspend()
> path.  After this patch, driver.pm would no longer be NULL, so we'd
> take a different path that is clearly not equivalent.
> 
> I think you should do this:
> 
>   - 	/* TODO */
>   -	.suspend  = NULL,
>   -	.resume   = NULL,
> 
> and leave .driver.pm NULL by not mentioning it at all.  That should be
> identical at the object code level since those are the defaults
> anyway.
> 
> That almost looks like useless churn, but the point of this patch is
> to remove use of PCI legacy PM (pci_driver.suspend and .resume) so we
> can completely remove that infrastructure from the PCI core, including
> the .suspend and .resume members of struct pci_driver, so we really do
> need to do it.
Okay!

Thanks!
-- Vaibhav Gupta
> 
> Bjorn
