Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9FED2477FE
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 22:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729397AbgHQUOR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 16:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729263AbgHQUOJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 16:14:09 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B80C061344;
        Mon, 17 Aug 2020 13:14:09 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w25so18866125ljo.12;
        Mon, 17 Aug 2020 13:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xsAai51rIb4zpMco9xIZ5n8l/j6uQ8HM/aDD4YTbjTU=;
        b=Ql+5PffLCx1G0k/jst0OLoyNod+UKXLpkoTHsvO2UIaSMgueJIwuUYfs+rWXJI/gbc
         UFP6fhCQgQ3YABIDnLFxMCTfgWELQAAtJjIK2uPjPPBmuHUcPc1lYYZ1C06EvZ7z+NXb
         qXyOmYGpdCGzmmgOi7ckSmqXXlHGy3/vI+1YQuYYhPo7u+GHDpu0Ci/4bynUf0VhenC7
         9j+W/CQrUYvx5GpXYWr5duYPujTuZkZTgvMDyk1oYkGKnGnnIGhsuKs86js4iIflN2Lp
         rPIC21g1PvZDv2P6usjVV4i+Mq+qflIpIHzI7l6R8AamqnMPPwZXdulDh6jKCMU9PBeo
         5owA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xsAai51rIb4zpMco9xIZ5n8l/j6uQ8HM/aDD4YTbjTU=;
        b=Gwlxw6/EVfXO8qnhr7+IiRVAsmGcmih//tWTaqYDDh31kSWM/6XNR/S3hEZdjDBmYF
         Rzb1Cf1JyBWukj4chYHYNFnG40eQaJSL9Olc0YJfeo5MqG2yD6YBuAU9JH3JO6V818ci
         Y/8sC9zLpSJW5qrOasd+fopAO35G41F1XTnOBWBjpHe5gwKFyxQC+IJM83JsfgpRdMpv
         JVpRK9afKS+tJGGAj6wJj+/xXYJfhhR+HbiUW3ms6vKJxHqv+iiQLDbLNdPk6eV23x+E
         8BXI7fu9JyovhghPLtsd+LDA0PHziiPHuj5SZ7xaHcUIU+rL2SDgSRusukj6zK3hMfO4
         H7gQ==
X-Gm-Message-State: AOAM531FnngHGZnRvhzCl7L0C/jR5c88gfWmZGGVwHFZcdoOpD5+YF8U
        99Tg3+VYbTHadzKeGGKCLlNbQsa0XnsHtnkB
X-Google-Smtp-Source: ABdhPJykGHQPzT8NA4rxKSHmF2T84DBFXMgOY8u/Nt1GXu494jd/XQzBugXalclx80TpJNA1z53lxw==
X-Received: by 2002:a2e:9516:: with SMTP id f22mr7666051ljh.24.1597695247494;
        Mon, 17 Aug 2020 13:14:07 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:44e:940:d3b7:2194:831f:16b4])
        by smtp.gmail.com with ESMTPSA id c5sm5740883lfb.24.2020.08.17.13.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 13:14:06 -0700 (PDT)
Subject: Re: [PATCH 2/3] dt-bindings: media: ov772x: Make bus-type mandatory
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
References: <20200817155910.255883-1-jacopo+renesas@jmondi.org>
 <20200817155910.255883-3-jacopo+renesas@jmondi.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <2a942333-695c-bd99-af63-7ac55682700b@gmail.com>
Date:   Mon, 17 Aug 2020 23:14:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817155910.255883-3-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/17/20 6:59 PM, Jacopo Mondi wrote:

> In order to establish required properties based on the selected
> bus type, make the 'bus-type' property mandatory.
> 
> Binary compatibility with existing DTB is kept as the driver does not
> enforce the property to be present, and shall fall-back to default
> parallel bus configuration, which was the only supported bus type, if
> the property is not specified.

   Signed-off-by?

[...]

MBR, Sergei
