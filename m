Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE135402ADC
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 16:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237261AbhIGOgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 10:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhIGOgX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Sep 2021 10:36:23 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182FBC061575
        for <linux-media@vger.kernel.org>; Tue,  7 Sep 2021 07:35:17 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id m11so13131755ioo.6
        for <linux-media@vger.kernel.org>; Tue, 07 Sep 2021 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=70brYmQ6+1ufQMYFsWOGgibkX3Enhs6LAfAKzq09AJ4=;
        b=elVAEahglUxnv/qrIAMDViFQQ5umRNqc8c2dqT+o7VEZQNBfcegW4kjApTgtC12KkW
         0sGyZDXx4wk8FBFdmSVa9n40HPz8F3cVLvHJWg2HUtHAZpfcdF1/IcDhYZOLN4GV6T9R
         3O7NjbmYZCBpeUj+AwDw6kSJ3JXNr65UF1CzIqZxiF7XiG3JBDJKb8zV2CKTwYwD+vmk
         wcshnFXlmpGMbrsAaRfp4pwDUznn8o6zQQfh0fg/rOOEA6HAf3sPKePw67KQ2ZHzye9s
         j0DCDZYaaWU57VZD4oni6g6u6+sKGB6UQ3i1QXG58mYEqMO+ayaOZ3kvWE66a7YzCsbu
         nnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=70brYmQ6+1ufQMYFsWOGgibkX3Enhs6LAfAKzq09AJ4=;
        b=aeVWgJM1yeadNnRCuxxddcoSjWfLwbzojb+yNCWCpxr3YD1cC0OQymrZbcvrrk8pGS
         HK7+6WCJccZiG3XVa4bbXMFtfmR9gBfaOf/XU/se7KiMc/abRcBNKJx8mSNb9RyBA0mS
         i/epAq4z5ezm8gzbkRbkmwkweUG48Z6JRUFKOkce6imqxongW7Jk8MFYUgyX57/Z7Dwf
         Q5oWS52jMHCOswapfonPmVmx2oecKdR4uqpmjG8Zte9Td26KrRNEA5VDfM1a4AMICi1g
         3d0lvsUrTNLaL3dlTXLDq1G7vwL+jT54NlvfeClolkqPfK4AKd2uC9CWmXtb2eL0R4n/
         zTiQ==
X-Gm-Message-State: AOAM5305i7OVEhKtJBr2m9tWO027h3jLgbCjtzNbr8sZkZGqCCwbSFTe
        x2/1J54LErNbOMMDFhdovJItZQ==
X-Google-Smtp-Source: ABdhPJwufjE78HkaYIKW/u3XoNjfuQg+EHEg4y/Mz0mug6gWp8QiywdtVEx7NdvlZMskPvupzQYJdQ==
X-Received: by 2002:a6b:e712:: with SMTP id b18mr14595389ioh.186.1631025316529;
        Tue, 07 Sep 2021 07:35:16 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id s6sm6468185iow.1.2021.09.07.07.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:35:16 -0700 (PDT)
Message-ID: <b6833d72bd6287f2bbc145a707b38d3e12226585.camel@ndufresne.ca>
Subject: Re: [PATCH v8 00/15] amphion video decoder/encoder driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date:   Tue, 07 Sep 2021 10:35:14 -0400
In-Reply-To: <cover.1631002447.git.ming.qian@nxp.com>
References: <cover.1631002447.git.ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ming,

Le mardi 07 septembre 2021 à 17:49 +0800, Ming Qian a écrit :
> Hi all,
> 
[...]

> v8
> - move driver from driver/media/platform/imx/vpu-8q to
>   driver/media/platform/amphion
> - rename driver name to amphion

Thanks for the rename, this is appreciated.

[...]

