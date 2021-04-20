Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683CF365A5E
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 15:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhDTNnM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 09:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbhDTNnL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 09:43:11 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730ADC06174A
        for <linux-media@vger.kernel.org>; Tue, 20 Apr 2021 06:42:39 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n10-20020a05600c4f8ab0290130f0d3cba3so1118570wmq.1
        for <linux-media@vger.kernel.org>; Tue, 20 Apr 2021 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=M4FJ5ioYm/Nd7Ome8to0PMaOyTbcDMqn1sP6/KZtQbI=;
        b=RNt2aBjhG+HOdbQwHaOfgJxn3qWbwaaUHOMQoEGzIFoaFoQCEhLzIHPlnxc8vW4IS0
         4E82Hd8nd8HI9+lrJy6MQUARzDUDhVYf14xfFZMGusgCvSPQLTuA5pAQW20RUVoyv0pU
         3t4JwFuMesaxYQTKI9H8IRtw4TpbhH9mpjMa7EGQvJRzDat0uIDMZDYwrNfN/R6ZHtcE
         3bhRiAoQZJkMg2KJke7T7ERlkqAFpw20VWWmpkEny7NmDi1HqQOaj8KjcUsp9RrizbZq
         dR33sN/T0y0rOIdk668TentTyQW2iDsu73xSqVw2kZhROV3fNBBVreBC322ub8r5iQ2m
         qmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=M4FJ5ioYm/Nd7Ome8to0PMaOyTbcDMqn1sP6/KZtQbI=;
        b=q+ru8MAmuLkSKrv37ati0J0dgNV8+/errESY81Q9WocZMXUvb44vWg8jLlb4yCBmRo
         3YkLvuC6nxzuGQOPLEzO8Vd5RC+3mJITppkyADOhYDhJy9+4wRwHqwl3DHNecirCQoYg
         3zFxDay+9VLNesmHDsJlLaCLxcB4KNUQd+KhVl2xA8UsMNlt+mTJamwa2WUkpt8zWchF
         iFXGVp/ZPMJjbiNFS4R30whgLHkiGAaTSjYS4JpU8EhPKaXpSFM12dW9xbRJ+/zxJraL
         Tn0dH7jNblMgDFN9a8O/7UTW6MltQTOu7am1Gz8pp1d40AkA4hIYYEfP1OSESV3d7mq+
         GGvg==
X-Gm-Message-State: AOAM531OePW/m63ug0Mi+AufLIWgOD8WkZPJLYXhdZ/pVIJytJBO2Xd3
        nrLmPKqkPGQQFN3MKaFGTOwoJHxCSsa+icWT
X-Google-Smtp-Source: ABdhPJz6jNVWOKeyB2Y9yzdry3palR5eImcMWsCI2aQhD8klPL2b+uBQHJk+DE3rToybbtSyLDHaWQ==
X-Received: by 2002:a1c:b656:: with SMTP id g83mr4559867wmf.163.1618926158253;
        Tue, 20 Apr 2021 06:42:38 -0700 (PDT)
Received: from ?IPv6:2a01:cb10:59d:cb00:a95f:de15:dd1:45c4? ([2a01:cb10:59d:cb00:a95f:de15:dd1:45c4])
        by smtp.gmail.com with ESMTPSA id m15sm24506042wrx.32.2021.04.20.06.42.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 06:42:37 -0700 (PDT)
To:     linux-media@vger.kernel.org
From:   Jean-Jacques Schott <jejaschott@gmail.com>
Subject: supported webcam
Message-ID: <84221909-74e7-50f0-6916-e3b3fc1fca21@gmail.com>
Date:   Tue, 20 Apr 2021 15:42:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I installed the webcam Microdia Terra HD 1080 PC (lsusb ID 0c45:636b) 
successfully on my computer running under Ubuntu 20.04. This message is 
because I did not find it in the list of supporter webcams.

Thank you for your attention. With best regards. Jean-Jacques Schott

