Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8AD1FFA91
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 19:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729965AbgFRRwY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 13:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgFRRwW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 13:52:22 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94416C0613EE
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 10:52:21 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a6so2630155wmm.5
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 10:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Lb6ruUo4th4gczpSuevPe5msRghKn9eEg7we4tRduH4=;
        b=eGgDOyjrGAgWo8+oJBjv2YRlI0KPsVR0vk3sX9sj5UkJB3QMBW4oB/V3LHRO5p+jkR
         AzFtvoivhxfC58Yswr8wRmbhgXOtENtAyrJUVC1EV5C0H+PasAaahOh0c7MU6DXy4eBw
         fuWwyC4exoBoszRiG/M/X4Hssfd9RctogKm2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Lb6ruUo4th4gczpSuevPe5msRghKn9eEg7we4tRduH4=;
        b=hIoFF1UkPE+yoIPMOzvWnC5qJckBgWj6jeNXwYCMdMvzibtmfb/KKlp9fuHZ0QFuyB
         s+G+JWsUPeeNOPIjOo24CcM2OZfeedmqiq/iH0hwJhcy1IMlCE6khbc1GydtKDiThD78
         BOfdmUmcOhMQ/lQNPxaOyALBLhudb2BEzzGJRgB88UqJfQ5T/aXBT9K6+ObZ5qySccl7
         7KsUYblPbzWLp0aDdx31hrR73+vZJOlTNxe9h4JwdmqVVT/obJalD1l6AQeav24KIOR8
         /othnNBpyOe3m4/rFnslRgAwIaS6iJfTgTJhHE1IxOCb5JAj1HRKoHsbEH+fG7W4TM27
         kvRQ==
X-Gm-Message-State: AOAM533gFuH07/x3Mtx7014ozHtrxF3FQtYF11d1nRNMMq+BTSd48QNZ
        GYjgyECoCDQ6anGBaeYbn5iuUA==
X-Google-Smtp-Source: ABdhPJyN6ugEFVxfi2oUTpklkACeaBduQoso3/vz2+EfcawKtoU105dOecEZxHdsjW8oylGRMPEBSA==
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr5352893wmk.11.1592502739874;
        Thu, 18 Jun 2020 10:52:19 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id o1sm4589796wrw.20.2020.06.18.10.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 10:52:19 -0700 (PDT)
Date:   Thu, 18 Jun 2020 17:52:18 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] media: v4l UAPI: add
 V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
Message-ID: <20200618175218.GB10831@chromium.org>
References: <20200617014928.4374-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617014928.4374-1-yunfei.dong@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunfei,

On Wed, Jun 17, 2020 at 09:49:27AM +0800, Yunfei Dong wrote:
> This patch adds support for the V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
> flag. This flag is used for RO Request.

I think this patch series lacks two major things:
 - a cover letter explaining the feature and what it is needed/useful
   for,
 - a user - is there an upstream driver which would implement this
   feature and benefit from it?

Best regards,
Tomasz
