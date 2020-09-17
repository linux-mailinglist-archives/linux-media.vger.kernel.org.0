Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9136626D490
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 09:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgIQHWK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 03:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgIQHWB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 03:22:01 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6F6C06174A
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 00:21:58 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id k8so661901pfk.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 00:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=njxvBj+jaweLyg+GmR5CC8vxV8vTifRpJeXbsSVbYcg=;
        b=No2y89Sh2PBfTQocf03ySzKDl2BzUJmhBVslf6zTPaqIsxVGUrz0rbeqDXv9GNFAd9
         6wL2tZ/+zbqcIfATvZFD3Xy4VoM6SU16srao3J0Dxsg8TEa30Cd53w2ZxtYdN2N/l7+p
         U7q5VsRR90sLsUNUOaPjfe2asudU8fMdSwTyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=njxvBj+jaweLyg+GmR5CC8vxV8vTifRpJeXbsSVbYcg=;
        b=Hlh0MxNVbZlNbZ0iRzlGNp+3dZqUnoOWKkaZ784yTBMJCYeuKxKvjWHyNIisnM/fQt
         dFeC9pybO5wWkWI9W7xgQJEdhuo/bDj0N0zAMaYvIaLH3NZEzvsMI2J4AwNs6vjEi2Q/
         vmWWIXvsoUwlG+rxLIoMpsrlO7IPEqRlNbzC1mTY82Ra3U506GM+chvXKEf4XVTaP/XS
         vUJ6Bx8kd3c4WTmkbt5qi9WUCZ4d+E3raGW7BmKs4jquI5hIzLSizGrE5afmCI7JcuZa
         aS+atRVeDg+zT6mzyuX/R7ziD7slVWv0/6h38nu5m78e7X+g+dME+viWrVmKZAcRaLT9
         y38g==
X-Gm-Message-State: AOAM532ls5NElpQi76fKES6CTSTO8LkdctWGvkKm9eU9mCeOmLvjv/36
        cJRBcXRpmgIXEg9RRYf+1V8dwf5PFN7Wrw==
X-Google-Smtp-Source: ABdhPJz7M3Ld7un122zPC4DpLwSSAo7WKQaFjnOY6jP0NUqDocAzn9z5ferYNPXyujkuu/fnY5qjWQ==
X-Received: by 2002:a63:2dc2:: with SMTP id t185mr1076693pgt.28.1600327317908;
        Thu, 17 Sep 2020 00:21:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id j6sm18898919pfi.129.2020.09.17.00.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 00:21:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1600305963-7659-4-git-send-email-mansur@codeaurora.org>
References: <1600305963-7659-1-git-send-email-mansur@codeaurora.org> <1600305963-7659-4-git-send-email-mansur@codeaurora.org>
Subject: Re: [RESEND v2 3/4] venus: core: vote with average bandwidth and peak bandwidth as zero
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Thu, 17 Sep 2020 00:21:56 -0700
Message-ID: <160032731621.4188128.4307986933169687298@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Mansur Alisha Shaik (2020-09-16 18:26:02)
> As per bandwidth table we are voting with average bandwidth
> for "video-mem" and "cpu-cfg" paths as peak bandwidth is zero
> in bandwidth table.

Why? It is in "the bandwidth table" but is there any reason why peak
bandwidth is 0 while average bandwidth is non-zero? Seems odd.

>=20
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---

Probably needs a Fixes tag?
