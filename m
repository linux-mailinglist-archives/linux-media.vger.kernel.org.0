Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3B1FCA0DA
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 17:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbfJCPCr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 11:02:47 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49210 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfJCPCr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 11:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=iDiKFMnCR5MdkrHnhWyU1C4se5pT9RPpBC2qGDIvyXg=; b=akM85PrbRT4gLr/T0NKqrRY8n
        TjMlrka0vDjhqnSjdfBu/OrXYlVEBk2p9c3Bl2W+JVTlxHDVaIjuEVw4ZV+zBmg+FvrwPwv1HsYOO
        hB68f7OrEqDp3LfErsSxTRmU8UahoFSBLGML8dJEwUuUlL7G5njbJZ5jIMuUEYDRE7ycPFUmdeilC
        4OjaHNR1scd9XivcwyfFaOpLmW3Xug5YVHe+unYdh38giHQYPMl32glC/IEV0AQu/cDW7VkmrwWL6
        kTluNEoSGdV79eDQaniqh5VliLSTGIaxvS+a6ARGKnA0ocRbpzqRcC+LronI0v097sdj2jCJwXBLf
        Zxa9W4pcQ==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iG2ct-0003bc-6b; Thu, 03 Oct 2019 15:02:43 +0000
Date:   Thu, 3 Oct 2019 12:02:38 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gonsolo <gonsolo@gmail.com>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003120238.75811da6@coco.lan>
In-Reply-To: <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
References: <20191001205203.4b1a5fb6@coco.lan>
        <20191002141359.30166-1-gonsolo@gmail.com>
        <20191002141359.30166-2-gonsolo@gmail.com>
        <20191002142744.GA3475@gofer.mess.org>
        <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
        <20191002150650.GA4227@gofer.mess.org>
        <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
        <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
        <20191002154922.7f1cfc76@coco.lan>
        <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
        <20191003080539.2b13c03b@coco.lan>
        <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 3 Oct 2019 17:00:08 +0200
Gonsolo <gonsolo@gmail.com> escreveu:

> > So, I would add a msleep() somewhere after the firmware update.  
> 
> I tried that to no avail:
> 
>         release_firmware(fw);
> +       msleep(1000);
> 
> [  107.903918] si2157 2-0063: firmware version: \xff.\xff.255
> [  107.903920] si2157 2-0063: querying chip revision...
> [  107.906970] si2157 2-0063: chip revision: 255.255.255.255
> 

With the original patch you proposed, what are the logs?


Thanks,
Mauro
