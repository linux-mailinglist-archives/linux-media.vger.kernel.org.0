Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15BF267E8A2
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 15:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233931AbjA0OwK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 09:52:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233929AbjA0OwJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 09:52:09 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE01A35B3
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 06:52:08 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id b7so5211859wrt.3
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 06:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TNoTiqKiC4A4hdYSKC/RtdRao/xss5H/F7is0bTuyV8=;
        b=ELDRKgAomNe2IEMii7uzDEZhHsrDN9BHJ5KtOzFSK374QR4wNfhV7VJvkV28/4x3P6
         6cEsRWJzX5BO48K6LHgh4Tvo7KesxXm647XZOnpQugoK1U3RPhccS2FRafkqWGQPPwWP
         6PIUhcagQ6ZG3UOeXFnS3r1QM+KNi3cpLrojkUacoV/6DggExYRtpXqXQICzre7grMd6
         NcrnA/VYKVXA4+T/8+k9fmMAk0Thgn5cqhOpWKxgaNV5sE+GyYF0xL8FNTUh7lQ+axuk
         h0j1y/J/SJgdQNTrgl+jjIQceMmHFK5rorMkmXdonM5KcE/gVvFaR3JPd9gPsgWOmVMY
         ZqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNoTiqKiC4A4hdYSKC/RtdRao/xss5H/F7is0bTuyV8=;
        b=rKbdvnXQC+fCfmLVr0skBGnh40FFjmNTCarhTIrFpjkQGrbk/kOC8ZmigJkqgqm7aR
         zdt9LAt3N1DP6G7iniB8c6iURRdWVqsQ09vCsEji2X1Bw2p844yKkyaMhnLzW8HwcXEL
         CjgK4WuFDQ4M+mz9QBcWk2S39MxLQF5MdMwRrid1V2IeNkvG1WkFtEPUVcJhNB6wveLI
         GMpJwLPm7s8PgH19mYw/HqeXtOaEQVwqEFGUNzuTjH8jNBSzGkvotQLnJQY04+8cY545
         pE3z5niCCa87gfIxgH+Wt0NGooRjfiohpLPSggzdKZzLD+lruDo8gyei5v7BMh4Xs5Zm
         zpUQ==
X-Gm-Message-State: AFqh2kpg3XwiJ/7lgPV0d0v8818Z2W9TwvpMb8hr1kksk8FSwujV5FKI
        gXtW/hqtUi/uQiQR6N/hHu7NSfdD+rY=
X-Google-Smtp-Source: AMrXdXsAo1vsalLUGFagVHTwqSk35ZKp6h8a0sa59fVzIWFAizvlosa6qdDp+fmck2bdN1hpH59qsg==
X-Received: by 2002:adf:dc47:0:b0:2be:5ca4:7480 with SMTP id m7-20020adfdc47000000b002be5ca47480mr20766148wrj.46.1674831127323;
        Fri, 27 Jan 2023 06:52:07 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t27-20020adfa2db000000b002366553eca7sm4171214wra.83.2023.01.27.06.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 06:52:06 -0800 (PST)
Date:   Fri, 27 Jan 2023 17:51:49 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: Can smatch handle this better? (was: [PATCH 15/17] media: i2c:
 adp1653: introduce 'no_child' label)
Message-ID: <Y9PlBTozKCj6Mv8+@kadam>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
 <20230126150657.367921-16-hverkuil-cisco@xs4all.nl>
 <Y9KaFkDXIWjiKPzc@kekkonen.localdomain>
 <7bd53f49-c7ae-db42-35a7-51d7b27d079c@xs4all.nl>
 <Y9PGezJ9ww20xCup@kadam>
 <b282ed11-2de9-cf11-8e11-a1bd35397013@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b282ed11-2de9-cf11-8e11-a1bd35397013@xs4all.nl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 27, 2023 at 02:00:51PM +0100, Hans Verkuil wrote:
> I think that if you were able to check that all the code after a goto label
> consisted of variations on printk, then that would solve most of the
> false positives I've seen in the media subsystem.

Ok.  That is doable.

regards,
dan carpenter

