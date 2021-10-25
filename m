Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1CC0439B4E
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 18:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233917AbhJYQRw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 12:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhJYQRv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 12:17:51 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4411BC061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 09:15:29 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id y78so5957484wmc.0
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 09:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=YfXAT9J3zg9nM6acPCxL/mbo5sK8qaM6YnGKL8Z4sis=;
        b=AWg0kI+n5Qz+KOgHdnePtR9QI0EJQNR9ymM4xxpxLH32V+OqnFfNhVebESKNeZkMYs
         VrnzWaL64M8zVq/kSYn8yHy2AwighyaraIEd8JQBeNurOQNyYhqRFkHyMKvBxqMv4mpU
         lVxc4EX6HDNyx+c4oEEimSV3HwbcpYI6kvDtbEtXCetVw6+NqzwbQ2R2185qp9zXOYNW
         3QI6OAMh38Gcp+rF3uk7rxT+qB7dpAGPz2VOYDKx6V+XMgUIjcSXe+IXLfgchGLx9GFP
         G3N/U4ls6loXtPdrcRLgJRwc/PHT68HUxy18wgfOwYTC0reFgzj3edLLMFxAyrLCW7iS
         tz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=YfXAT9J3zg9nM6acPCxL/mbo5sK8qaM6YnGKL8Z4sis=;
        b=TdiBTtpLebiyNa/+s8TALIKEHUIFPDQNgUxI2phrDTg2BRbVslglQjvztVUaAKIHYF
         f5a4+suekq204XP149C6HhJVvgEo4F1iISBYANBymKPkMi26Fr+q0t84V6Af/LOp6dUn
         zOlHAEhy0tpotgJA50HVHUbd9TWPVqFSC4edUic/Kg5gk3MuLWPSK8+vsRGjlrXUYsZ4
         X94ikCbmQXk7LNNCRmpHMtZnwxygMZB0+y04S2DQdGMLwPu5bgWG8EIPNjatROgxYe21
         Ea5IRuG5YXVfkLpO6qTFsJN/BDn5beG94SwkiFr3DngWl+dqTjJGZAtPnMmjGDUHrljd
         KBjw==
X-Gm-Message-State: AOAM533Qfhdd0O3cWcETtzFS4Kk5V+BwLKUotND0yNBMpXrUFr6gSLkB
        B7v38rMvLcI1A2JlqXKwiAbYuA==
X-Google-Smtp-Source: ABdhPJzlJEUM4JECSJtllaaEViuXR3XCiEmdLs27IiVm2DR7HM3U0zuqDIaPaAvBcGPKwoplfCwp8g==
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr10315342wmk.139.1635178527938;
        Mon, 25 Oct 2021 09:15:27 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k6sm17037479wri.83.2021.10.25.09.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 09:15:26 -0700 (PDT)
Message-ID: <9ea50569-1d4d-5413-5c77-241f2a589f09@linaro.org>
Date:   Mon, 25 Oct 2021 17:17:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] media: venus: Synchronize probe() between venus_core and
 enc/dec
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Tadeusz Struk <tadeusz.struk@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211025144345.267107-1-tadeusz.struk@linaro.org>
 <72f8dd7a-66c7-fb50-db23-f98ba753af1d@nexus-software.ie>
 <bba3acc1-cfa1-0c53-75de-f4ffa0a2bc9e@linaro.org>
 <00b817a4-f1ac-6a94-5f1e-836d8d313406@linaro.org>
In-Reply-To: <00b817a4-f1ac-6a94-5f1e-836d8d313406@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/10/2021 17:03, Bryan O'Donoghue wrote:
> child devices drivers/usb/dwc3/dwc3-qcom.c

doh - learn to type

*child devices drivers/usb/dwc3/core.c
