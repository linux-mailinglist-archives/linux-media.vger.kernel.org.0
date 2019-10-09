Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE4BD1B60
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 00:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732019AbfJIWEY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 18:04:24 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38607 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbfJIWEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 18:04:24 -0400
Received: by mail-ed1-f65.google.com with SMTP id l21so3562795edr.5;
        Wed, 09 Oct 2019 15:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8xFAVPxw0yLNfKFHLVKiSpwEPAsm+F07AwL2PEsos1o=;
        b=qic0kjvQT1MVEkM1R8pet26usbzElQv3vzDgOPiFavocFyU7xaDQOT/qSp01z9fLQS
         RHt4LvrFv+s/Rqd1rF7eNCcH86ewKE3YJivXCO6J/uaM+IXBogE6aIZk97ZJAMNRmzqA
         ccvly8LHM5RhfHI/oqPZoaRgvY5VZHfgRH/bqT9+Zkqlqsu+OaFlXbqxF6C9sqboxkfK
         FLFvr0i0GAJeYtL+3IPhFjeZhFneuB22qFTNQ7Q5AJuQ0X9jRANL+Y/+IVC8cuxKXzyC
         YgkpY9UgWczqJtByJREpEKKdwKQbzg2d0/g72AlXzNg/8hACQPL3RzJjoDu9WKYc1xuj
         WsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8xFAVPxw0yLNfKFHLVKiSpwEPAsm+F07AwL2PEsos1o=;
        b=SueWI2plIcOgjisrlVq9XQYyktI0owp+L2vGUmquBjc82yPo0SxGLQ/7lbepPyLUPl
         WuT3UYSJ8am7qndp1z82VSh2hiM3EsiyEQu3Y3UExSNjzK4HcMxqQvikW+yYHwmyGEWG
         74OEfQUeBHDRqu4VR/nLMskhDps+eZ0jwfjOAyanvXQAQaADaE0yfuFVOgkTxzae0nai
         5ionzRdwnhz55Cf2cM8fug/P2Gyixgr02T4s0IbYSYjXxSmRlYFAy++hRxZeH5t5/Hk+
         dcX4ksAIJFswsfdjSMRAsJktrzqs4uF92SsezRzf2VexKXbK6TYYc8s8MdysjXfEaZ8O
         FZgw==
X-Gm-Message-State: APjAAAVgDAyN2jq7LqECvyxfY2voRUH0yJkFQWRbzpNL94RZn6T5gjf/
        IrmXcbk4rBdzo1AvKbfbEjs=
X-Google-Smtp-Source: APXvYqylwyk2yC30uO3bI2cIjBpSUv9dx/f1V07c1JQbrxs1Ic7cdRp6BKLcOBYngoIqPl/9svn3Zg==
X-Received: by 2002:aa7:d90d:: with SMTP id a13mr5110763edr.2.1570658662158;
        Wed, 09 Oct 2019 15:04:22 -0700 (PDT)
Received: from Limone ([46.114.37.24])
        by smtp.gmail.com with ESMTPSA id d2sm547540eda.20.2019.10.09.15.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 15:04:21 -0700 (PDT)
Date:   Thu, 10 Oct 2019 00:04:18 +0200
From:   Gon Solo <gonsolo@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] media: af9035: add support for Logilink VG0022A
Message-ID: <20191009220418.GA3131@Limone>
References: <2942b7ca9ecf86b6bff75c10ccfca25c173c3f0d.1570194906.git.mchehab+samsung@kernel.org>
 <9618316567493f917c41109f7dba94e533fbfb4b.1570194906.git.mchehab+samsung@kernel.org>
 <20191009214405.GA3621@Limone>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009214405.GA3621@Limone>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Unfortunately, after applying these four patches it doesn't work for me.

Your patch disables firmware loading at dvb-frontends/si2168.c:449 while
my original one disabled it at tuners/si2157.c:554:

        case SI_BOGUS:
                dev_info(&client->dev, "bogus chip version, trying with no firmware\n");
                fw_name = NULL;

According to my dmesg the following chip is found:

[  141.726488] si2157 10-0063: found a 'Silicon Labs Si2147-A30'
[  141.777647] si2157 10-0063: firmware version: 3.0.5

So according to:

        case SI2147_A30:
        case SI2146_A10:
                fw_name = NULL;

it should work. Hmmm.

g

