Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACD5C65C11F
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 14:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233237AbjACNsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 08:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237290AbjACNsf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 08:48:35 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580E7D2EF
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 05:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672753713; x=1704289713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I4UfS7ll/Omskt5mxlzUQjVMnxa8JQVnZeKbST7i8O0=;
  b=FGdCAnNm+XLnAJ13ySHP4rX1M6SfQWIVM9wlmtKkBGYqgX6tsyYng4En
   KBsnDv+/uULbJ/wJ6bjb0Vdy5q36nMukrWPcRsdLy1wvGeJgo/lxzoptG
   g+hshL/Rpy1MfemPAItGFg2ZUvDsiniSUDwyUHLtuBqMtCkB6JOFOOt8J
   t4cqL7n3FdH7wcN/CM/60CWcXzHgnLOsVHxsMio6U1l1UoDnYOTvZWynW
   iCAVot5/CHYRY2MD9cf7g3q+YNFh9ZkveuynWGXwVVGobTC92qohZ+FZv
   nUX9MmNsYolJx9dSjR7TG4DzrRGhZZc55cBwSDOdI+fZ18BTAKsf/pphE
   g==;
X-IronPort-AV: E=Sophos;i="5.96,297,1665439200"; 
   d="scan'208";a="28222576"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Jan 2023 14:48:31 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 03 Jan 2023 14:48:31 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 03 Jan 2023 14:48:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672753711; x=1704289711;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I4UfS7ll/Omskt5mxlzUQjVMnxa8JQVnZeKbST7i8O0=;
  b=ErpHjF39aM+t3NTijAt6T6OWgBf+J26a4twYUiznYNXbXwOcDozGMn0v
   6LrG3w/+eMKARc/xErUBhwoln5VfPcZrs5Em8kasvxhyk1MGcVVFHcW03
   r/YUFW9co7SO4JXQdojv5ZDeHZ+AYEnv/bFjWPsAmRwRmJmWjQgrWHyDt
   nkjWcUoiQRzYFDjloA4TWxTQtAOJ9DzV0NRqAyd/Yh8FxFna0uvN/yS+S
   AHPoUnggfqoIseyKJFLkFLdSKCHrthTerVY/g4cbnla9PJMUZ/uD3XdUb
   UsFWUV4RdgDO2uwCsSkRgw8BTXAnolr5RhuZ/nhqnjnE/WJT6u1oxCSO+
   w==;
X-IronPort-AV: E=Sophos;i="5.96,297,1665439200"; 
   d="scan'208";a="28222574"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Jan 2023 14:48:31 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 14E41280056;
        Tue,  3 Jan 2023 14:48:31 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
Cc:     linux-media@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] media: dw100: Add a missing unwind goto in dw100_probe()
Date:   Tue, 03 Jan 2023 14:48:28 +0100
Message-ID: <6400080.K2JlShyGXD@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <42a8016a-8922-236d-30a7-9b12b53a9bb9@oss.nxp.com>
References: <20230103105534.3018257-1-xavier.roumegue@oss.nxp.com> <1962839.8hb0ThOEGa@steina-w> <42a8016a-8922-236d-30a7-9b12b53a9bb9@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xavier,

Am Dienstag, 3. Januar 2023, 14:35:35 CET schrieb Xavier Roumegue (OSS):
> Hi Alexander,
> 
> On 1/3/23 12:01, Alexander Stein wrote:
> > Hi,
> > 
> > Am Dienstag, 3. Januar 2023, 11:55:34 CET schrieb Xavier Roumegue (OSS):
> >> From: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> >> 
> >> In case the IRQ allocation returns an error in dw100_probe(), the pm
> >> runtime is not disabled before to return.
> >> 
> >> Add the missing unwind goto on the error handling path of the IRQ
> >> allocation request.
> >> 
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Reported-by: Dan Carpenter <error27@gmail.com>
> >> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> >> ---
> >> 
> >>   drivers/media/platform/nxp/dw100/dw100.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/media/platform/nxp/dw100/dw100.c
> >> b/drivers/media/platform/nxp/dw100/dw100.c index
> >> f6d48c36f386..189d60cd5ed1
> >> 100644
> >> --- a/drivers/media/platform/nxp/dw100/dw100.c
> >> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> >> @@ -1571,7 +1571,7 @@ static int dw100_probe(struct platform_device
> >> *pdev)
> >> 
> >>   			       dev_name(&pdev->dev), dw_dev);
> >>   	
> >>   	if (ret < 0) {
> >>   	
> >>   		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> >> 
> >> -		return ret;
> >> +		goto err_pm;
> >> 
> >>   	}
> >>   	
> >>   	ret = v4l2_device_register(&pdev->dev, &dw_dev->v4l2_dev);
> > 
> > Doesn't it make more sense to request/allocate the IRQ (and other
> > resources) before enabling runtime PM?
> 
> I would say this does as much sense as the other way around, as soon as
> something wrong happens, you have to restore things as it was prior to enter
> your routine. The most optimal function call ordering should depend on the
> failing occurrence likelihood of each individual function.
> On the probe path, I assume none of the functions are expected to fail.
> But I understand one could argue differently.

-EPROBE_DEFER teached me otherwise ;-) What I actually wanted to highlight is 
that calling the devm_* functions first, reduces the cleanup path for the 
following setup calls.

> So for the time being, this oneliner patch addresses the issue reported by
> the robot.

Sure, on the other hand it's less complex if you can just return in an error 
path.

Best regards,
Alexander



