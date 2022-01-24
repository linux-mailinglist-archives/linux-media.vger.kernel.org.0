Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B6E497847
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 05:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241517AbiAXE6f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 23:58:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235690AbiAXE6f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 23:58:35 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5430C06173B
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 20:58:34 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id d13so9377643ljl.5
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 20:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FXFmxDQy5UQl/OJS+xVXq8kS8ITCXJeU6yfRYQPHIR4=;
        b=IAAnzfbBZCvY6XrMxJf/FhkYFyrrQ6JcDQXvBwGTARxIhvIqMQIz+jx3CkiD3bAYZC
         tZSuk9frdxlLTmnD7yahnmXJVib6LlaRdAa9TBotdxZ82vMZtCBNHcehk2nHPQqlhSlC
         MQ4trjLAxNNjQjvwEjudMSZHC+iF+k/4U06BZXs4t+iKsBG+TMhMtQt1X+ie9XPEw8yC
         y0fsZ5Anfpe7CBfTE8C2pDERPM3lTZkTuWDI1n56EgFya4NHxFCfKGwR7gTswW1ti+nv
         WAXBChFefvkRifmQbK7p+3+J/6GHeVxGzhlryrtWEqX1Ille/IiN+GyhhwSAQvoi8WmX
         XDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FXFmxDQy5UQl/OJS+xVXq8kS8ITCXJeU6yfRYQPHIR4=;
        b=lE4Bwbpmt6Tj+lVwfZXycJ5fC12gecypdpj3tn63fE3LGg4Kx+0UJlMHo7rPgKNaXL
         I/pxrKqZ6pzHrDfAdCb4JfWBk4AC0hlqCp4WMJEcj88zTTZ+H9ZXzmIHm0KP/6PDk5Ea
         y8X9h6+Bs2V6OrcckyHBLbtkEBP1uvtq1YizeJNkYdGl4ZtkYH1WPUyQLz/Q0+UDga56
         o6R68XBcXjuacEkTEdDqLlN46MdfrkAEVeRnHraSYdshTqO72PNbunRFjT3I93bo4xXu
         wNyrWvrM3LhDGlVx8v2rf6nbbmfXIq8CklhMNX+VawsYqiWkEmnB69FpoQXodbKxzgui
         8MWg==
X-Gm-Message-State: AOAM53057+ch6OlqHV0RJxqYeDzqFAnWWWaP0DTefbXNE8afRbqsQVmo
        LUyWrxHwwyzuGWFbzhpIqkF+Ew==
X-Google-Smtp-Source: ABdhPJzSmjj79qwcfBkc9iBrhtt2KBsfla9CnBnKbXJdkyL4UZY6dx7csn18EoOVBXcyDKHOgdGYKQ==
X-Received: by 2002:a2e:9001:: with SMTP id h1mr5355353ljg.273.1643000312478;
        Sun, 23 Jan 2022 20:58:32 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id r13sm1044312lfi.238.2022.01.23.20.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jan 2022 20:58:31 -0800 (PST)
Message-ID: <7bfc1e3e-c4e4-cdde-6e2a-0f05369b6af5@cogentembedded.com>
Date:   Mon, 24 Jan 2022 07:58:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] media: vsp1: mask interrupts before enabling
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220120081530.799399-1-nikita.yoush@cogentembedded.com>
 <Ye3MfnICIv0PeqT9@pendragon.ideasonboard.com>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <Ye3MfnICIv0PeqT9@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> If you're fine with those two changes, there's no need for a v3, I can
> handle this when applying the patch.

Ok, please do that.

Nikita
