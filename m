Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1789924221D
	for <lists+linux-media@lfdr.de>; Tue, 11 Aug 2020 23:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgHKVt2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Aug 2020 17:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgHKVt2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Aug 2020 17:49:28 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5012C061787
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2020 14:49:27 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id o1so172941plk.1
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2020 14:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=yRAye5F5l9hzR1g1P5dMPEhRVrsrXgvMRbsuClxK5F0=;
        b=aYAxKLO+2Nd++44vwrkooer5fORLLDqSDvBErgWq068zdHXMHzeisim1L/+G9ic6O5
         dNzUAomGUNjaDzTQy5YM3DWEsiWl1xsCLkIW3tZMbZhttwSRn1mAIPXFPe1gGxQo2tEO
         RDTUNDgaF1QpU9Qqd9uSYzY1wz1F8JzoAOtdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=yRAye5F5l9hzR1g1P5dMPEhRVrsrXgvMRbsuClxK5F0=;
        b=BkGSSF0vLurYUaBVp/3tCQFFFh4isHWwVu59ejoSFew15TTRINQ8JY/0e3YSEKWEJX
         nQNHosXrvFRjcowaz60kogNYFMbaCXl5jDeX6geGcJTbiw3qvC3cIAZA8Hp0AbLQeOc5
         UYzB1gFCy2RTdwqexYsm3/zmLGpeHoawWw8BDd2ifdOC/L95kGE1cwRyhuUvOhhgiw1X
         aTPZ7oLik3mTXr1jqdQGEThhVU767IBzeDAmV4WJAXRjUXeNcwTRsdrz8VVFfbTZjelF
         CX66nAp2xd8u3eRIoeqvf1gt7hxEsMoRk4yBKaKEE9XLc9+LMFuP9qKiA6hJCm+UzJDf
         Gsyg==
X-Gm-Message-State: AOAM532FTxQIA5dc+EY42YheV6k+Um6I9TXSGh+1PJn8uOdVoRPXGWPL
        9Txyigv1ZWcP93408TP9PHL+lw==
X-Google-Smtp-Source: ABdhPJxTaonzDdTXCXuqxdmP93HMUeWwx6e1dOqgdNNGwjyPenieCTBR8G9AO04BsWwnHSnOkJcplg==
X-Received: by 2002:a17:902:900a:: with SMTP id a10mr2552967plp.203.1597182567153;
        Tue, 11 Aug 2020 14:49:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id l19sm59212pff.8.2020.08.11.14.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 14:49:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200730095350.13925-3-stanimir.varbanov@linaro.org>
References: <20200730095350.13925-1-stanimir.varbanov@linaro.org> <20200730095350.13925-3-stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v5 2/3] venus: Add a debugfs file for SSR trigger
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     jim.cromie@gmail.com, Joe Perches <joe@perches.com>,
        Jason Baron <jbaron@akamai.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Date:   Tue, 11 Aug 2020 14:49:25 -0700
Message-ID: <159718256557.1360974.458611240360821676@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Stanimir Varbanov (2020-07-30 02:53:49)
> The SSR (SubSystem Restart) is used to simulate an error on FW
> side of Venus. We support following type of triggers - fatal error,
> div by zero and watchdog IRQ.

Can this use the fault injection framework instead of custom debugfs?
See Documentation/fault-injection/.
