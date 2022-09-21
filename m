Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCF695BF934
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 10:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiIUI2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 04:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiIUI1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 04:27:53 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F2B48EB0
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 01:27:46 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id w20so4889982ply.12
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 01:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date;
        bh=5AT8mOkKWjY5PWdM9jcjIYkswAmUffltx4x7PbMSoHI=;
        b=djiaXEiyV8nu1S2vVKUxdA6Mg8lW0dwLT3uGAPMS7ENbuq+sG8AFf7gIaIWr2ZWY5Y
         1TZBz2LWhVJ5s2J/DUYzl5FUA9kCR31TKNkB7xKwdP2GVYtJrfh1PAH8MXuH1yZy6qN9
         aSWHqY2QpCU95iIGviFJ/1TdozsEUzzsaFnhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date;
        bh=5AT8mOkKWjY5PWdM9jcjIYkswAmUffltx4x7PbMSoHI=;
        b=m7HA6nOwDU5+35Hgdrp3r5LivQ8ghoZc/uz/tl/9LFzsOaJV9aHBiQRzWNcAaB5RD3
         yOupNwCCblHFTa29pMNQoW8HRCpltGItuAZzmqdHsWsoqxRBMWLeTam5oZ4CHgSDBSSF
         +TPJJYLQY2taUa2CECiuAKq1az+B0aRCmdBe2520EXR/IM2Zc5+dFwpfUkzmvRWX2etd
         CwI372ivZz3x53EooTUdAhqN95YiUQidTD9TgbjNuanRDajniHZYJIhv1rycEqVHMHXK
         KDVv19vmnY8UwSPip1WdnvEeP6wAv4OX3K/gQcfeOPY8HoK3cTGBcEZBiReJhLllc7FW
         8dSQ==
X-Gm-Message-State: ACrzQf3t+WuMRfYosje1iYKVxK58VOauTyWv1EvUdpPLPF3N4GOE9RxD
        DBA+qZwO1U+QlQkmsTyJTefCaw==
X-Google-Smtp-Source: AMsMyM6dMk7BgaHyy8W1l5PZ4gjmxp4MolRVNSdMI32fir6PU+gJStSn6cHQyCyuWs0A6yjWaJmtrg==
X-Received: by 2002:a17:90b:38cb:b0:203:100:bb53 with SMTP id nn11-20020a17090b38cb00b002030100bb53mr8401805pjb.107.1663748866049;
        Wed, 21 Sep 2022 01:27:46 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:cc93:90d7:674f:156a])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902eb8c00b0016dbe37cebdsm1296944plg.246.2022.09.21.01.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 01:27:45 -0700 (PDT)
From:   Hidenori Kobayashi <hidenorik@chromium.org>
X-Google-Original-From: Hidenori Kobayashi <hidenorik@google.com>
Date:   Wed, 21 Sep 2022 17:27:42 +0900
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hidenori Kobayashi <hidenorik@chromium.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: ov8856: Add runtime PM callbacks
Message-ID: <20220921082742.bhdgpxzuk32hfgvc@google.com>
References: <20220921081536.2551789-1-hidenorik@chromium.org>
 <YyrJPBXzL+MZH8az@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyrJPBXzL+MZH8az@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Sep 21, 2022 at 11:20:12AM +0300, Sakari Ailus wrote:
> Hi Hidenori,
> 
> On Wed, Sep 21, 2022 at 05:15:35PM +0900, Hidenori Kobayashi wrote:
> >  
> > +static int __maybe_unused ov8856_runtime_suspend(struct device *dev)
> > +{
> > +	__ov8856_power_off(dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused ov8856_runtime_resume(struct device *dev)
> > +{
> > +	return __ov8856_power_on(dev);
> > +}
> 
> These two functions are redundant now, you can call __ov8856_power_on /
> __ov8856_power_off directly. The return type of __ov8856_power_off needs to
> be changed to int. You could also remove the underscores from the names at
> the same time.

Will fix it as above. I just wasn't sure about the policy. Thanks!

Best regards,
Hidenori
