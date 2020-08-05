Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8FD823CD9A
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 19:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgHERjp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 13:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728913AbgHERe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 13:34:26 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE49C061575;
        Wed,  5 Aug 2020 10:34:25 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id m15so24027311lfp.7;
        Wed, 05 Aug 2020 10:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8HNwuenZ8HVoSfRFM1yr+yhY+DsPUgYL0/MOa8/jpuw=;
        b=iBRKOMudr0THs5hTgteotC5bRZ/66USrPw3+qrK/dEZs9FSP5eKITva6gk0ucJ7i4L
         AFAb35yJ8hLuKDaybk/amuGvLAWCnXCxxaZHsxIb5cXpjtVb0GdKhh1hskI8yinJFElG
         eYNS1JXAFbdDNPRZ5GmEWrKB+8UQTZxbhkbNac9zlFe59Az0VOs1x/cuHuleDVe6COhB
         5IuVxYNH58/w6iQxy7x1pM7VMxGRRwnGIqyfC/4GiEwgvTUlwVUPdjBtEZ7zeUlcq3rr
         DqHAzIdW3RCIZbFc538fnJYC/e/HOcxmjc/B2SBMMhnPHXhOx3OF+w9bG5VZci7DQTK5
         VbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8HNwuenZ8HVoSfRFM1yr+yhY+DsPUgYL0/MOa8/jpuw=;
        b=Q8KbsW9YIsaj6bO4gjFitCy/Wpae9wFTt3tHhdjEegLW8wGz1yEsWN7i1Rd+kW0ujf
         LfsvfP2VL3W5oQKWiHInhBSeOMFJgFeNLo/K7c/R8osPiA1NKECC01TQYaICyWYkRM32
         oXdLcmf2g0Ww3PiguhWpVpQeLLgXOqfuFDUTcdD8JF26oNZuod51Qt+TA68mmBMmusZ1
         mJHYgkySgof8v9c6v2Suu+4FWhVd4advmq5rwF4oO+jTkXtcDgVP5ZUJu9mLNzxXKt1X
         4+inyx/bSs6bsiS/IjVGlTFyYAk5Nckm9BAHQya7y04fXXKKEj2zzC/sj+4WdJcX2xqk
         kfEw==
X-Gm-Message-State: AOAM533oNEW16+OLEHMjZMe2AG0cdNN8vljxnWebtggK2Y+Ozs8MO5hY
        xRSzGna+3ogPIUAeod68mrDKaISk
X-Google-Smtp-Source: ABdhPJyjhk8Q6HUt9Yu+pqu8UnN5oD9llj148EBGwcEGKoESer4YRNK3ivBgN2/rmEQSpgxbLQ812w==
X-Received: by 2002:a05:6512:1182:: with SMTP id g2mr2081022lfr.126.1596648863749;
        Wed, 05 Aug 2020 10:34:23 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id x6sm1370280lff.64.2020.08.05.10.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 10:34:23 -0700 (PDT)
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <1596469346-937-9-git-send-email-skomatineni@nvidia.com>
 <20200805134600.GA3351349@ulmo>
 <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
 <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
 <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
 <ed80bf2f-213f-286a-59b2-fc85e4181b3d@gmail.com>
 <6eede805-80fd-016f-22f8-b6d25f6587af@nvidia.com>
 <1c12e40e-de7f-0599-a941-82760b4c7668@gmail.com>
 <9ef0b875-e826-43e2-207e-168d2081ff6a@nvidia.com>
 <4689cfe9-e7c4-48bf-217f-3a31b59b8bda@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0e78c5ca-c529-1e98-891d-30351c9aae81@gmail.com>
Date:   Wed, 5 Aug 2020 20:34:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4689cfe9-e7c4-48bf-217f-3a31b59b8bda@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

05.08.2020 20:29, Sowjanya Komatineni пишет:
...
> UART_FST_MIPI_CAL is the clock used for calibration logic which is FSM
> that goes thru sequence codes and when done waits for pads to be in
> LP-11 to apply results.
> 
> MIPI_CLK is controller gate clock which is also need to be kept enabled
> as incase if it sees LP-11 it updates registers so its recommended to
> have this clock enabled.
> 
> We can cancel_calibration() in CSI only when csi/sensor stream on fails
> and in which case there will be no LP-11 so we can unconditionally
> disable MIPI_CLK.
> 

There is no guarantee that the fail comes before the LP-11. For example,
some odd camera driver may have a complicated enable sequence which may
fail after enabling the hardware streaming.
