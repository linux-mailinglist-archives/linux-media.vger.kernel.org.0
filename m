Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF486187AD2
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 09:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgCQIIH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 04:08:07 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43041 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgCQIIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 04:08:06 -0400
Received: by mail-lj1-f194.google.com with SMTP id r7so21693455ljp.10;
        Tue, 17 Mar 2020 01:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xJDoChAKlMblDnmdsWkrHiAcckWv+m3XVo6l0TPCl5M=;
        b=qqNOC86QEbDtH12YTw6vhbr3LNJZVbggyXoR5v+zm9yqy4dDAmLkRrpnCpSXvdAiZL
         IboHI+kGpdv+fFLxgsMSIZhR8f4TmjXerfnmWY5tItwLqFww2KBpJ8dnzlv+xla+TSkR
         67OZQ6uMUkUTE2On2maijpoQngQ0mT+bCzuunr1HQSVI/fbn4y6cppioG6BaxFHXWqDj
         gKWfwjWVBAaDCB8Cxesy2QTusbzwOLtQrqu4fQAs0he2t9DzBUXWAjU04xnPQXhLq4Ab
         IM/G81ipMbL41jwI14qQFi0o+ZK5t7VpxvVvIDiUQAVONn8kz5FmkfyxjtTiPL5cTSKS
         1Bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xJDoChAKlMblDnmdsWkrHiAcckWv+m3XVo6l0TPCl5M=;
        b=nCrOs+gAn3hqZoDT+5fjiqvwmPo+jUzLexrBbQJ2fuFmdKWjrHMzUg+c2zmk2/WPyP
         ZxJYEjF5XwlmdkS8/c5qijR6lIcL30vUcv1hwqGEQfjMPdbMjpnqmIzfDrlZpUEgzfi4
         DibZUY/VjEwNau/ms4BTnF7SgFY0U6oWag+Q4GO52B6+X/nRtesVdFLfuJqoOK4oWJm4
         KS4CsSpjl50+rBnzOmduszXQZWcu/Zpv/rcD45H5RiMewlWk1aKeGCJBeX1klItO9LIg
         9jdCNvQu9IrOu81wR6uNOJxH4nV2MGubRC+ebRrf+YEWMNTJKfhFLZhJ5tLM/D6cEX58
         m49w==
X-Gm-Message-State: ANhLgQ1kq/R44ipkV0kgQcsab7UsYkzOvmIiNhfXtnSzpNgaqzENyn11
        rw70ZdlNuX87PScJ7xVkrXU=
X-Google-Smtp-Source: ADFU+vvCQ3NoEJ3nb/OwR5lcRkL8eBY/cGrtriKrq/5tktFEr921qBkjihV+rjh0ZWyiMV4z1K2PxQ==
X-Received: by 2002:a05:651c:1047:: with SMTP id x7mr2013039ljm.246.1584432483618;
        Tue, 17 Mar 2020 01:08:03 -0700 (PDT)
Received: from gmail.com (94-255-169-249.cust.bredband2.com. [94.255.169.249])
        by smtp.gmail.com with ESMTPSA id 207sm1846451lfh.33.2020.03.17.01.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 01:08:03 -0700 (PDT)
Date:   Tue, 17 Mar 2020 09:11:19 +0100
From:   Marcus Folkesson <marcus.folkesson@gmail.com>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v4 0/3] media: i2c: imx219: Feature enhancements
Message-ID: <20200317081119.GB138007@gmail.com>
References: <1583846229-6799-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200317080135.GA138007@gmail.com>
 <OSBPR01MB359081F292B1F7E3D56242EFAAF60@OSBPR01MB3590.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB359081F292B1F7E3D56242EFAAF60@OSBPR01MB3590.jpnprd01.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Tue, Mar 17, 2020 at 08:03:49AM +0000, Prabhakar Mahadev Lad wrote:
> Hi Marcus,
> 
> > -----Original Message-----
> > From: Marcus Folkesson <marcus.folkesson@gmail.com>
> > Sent: 17 March 2020 08:02
> > To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>; Sakari Ailus
> > <sakari.ailus@linux.intel.com>; Mauro Carvalho Chehab
> > <mchehab@kernel.org>; linux-media@vger.kernel.org; linux-
> > kernel@vger.kernel.org; Lad Prabhakar <prabhakar.csengg@gmail.com>
> > Subject: Re: [PATCH v4 0/3] media: i2c: imx219: Feature enhancements
> >
> > Hi,
> >
> > To which tree does this patchset apply?
> >
> These patches apply to media_tree [1], btw v4 patches have been accepted and  merged into master branch of media_tree.

Thank you and good work!

> 
> [1] https://git.linuxtv.org//media_tree.git
> 
> Cheers,
> --Prabhakar

Best regards
Marcus Folkesson
