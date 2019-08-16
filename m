Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 298F58F84D
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 03:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfHPBFE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 21:05:04 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35340 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbfHPBFE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 21:05:04 -0400
Received: by mail-pg1-f196.google.com with SMTP id n4so2095737pgv.2
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 18:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x4CzuWcgunsZJs+WYtr2EuoxYtu+dTksDOtb4J/UCQ4=;
        b=MveWE7gFch9wflVEiO2qb4wNdP/Ge3Vlm/wvUUhrS8vBjEdsOt1u8AsuDXzmqdKTE+
         qeR0s22cQsERNNPRLw+JORQ62R3T/YO7WhZvyOSbn7owfybLO6cPgQhmzDc4aYWjg27J
         8lJ4GBgN59/IgPeJpgH3VqtDgcFcvGb3KDVzNx09+dwNM2TZrHYdk9R3bZtN15rl3PPC
         wN/onXY/HyeCTkxPGnNDzqLnsbzdNCFvfb99F7v8DV6NPo+X/rTxzySNklAeCpoab1Rr
         iPmEHDeUpwoVtcnu9XMo3Y1PKJ3Yn2Vh7em+iGYCHPqMYLyhnGKz9+Yc7XmX4XV/UlMs
         1vZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x4CzuWcgunsZJs+WYtr2EuoxYtu+dTksDOtb4J/UCQ4=;
        b=Y9N5+lLlblOTucWQZJ4hHMsKA9vJdhwLDuYFV7sy4jr7Mu49oYaR3cp7G1TusGxAfI
         MQ1ME9J+cx5noqjnpWHKii+iNzqU4JhDGeK9S9SaxIc1mkfJJPCpfMOUyPitaIE9YDgz
         LMpbEeuvgZ0mJ2OZgsvxEi83Z36ZL/0pgHQ+2cDJaanFbxgwx3aL2IC7RMQ2ovSIkp3v
         +Lg7IEIWmRBOU8hcmE6OGKMQcuyw6XPadtJvITsJHYaaLHZJ94Uib83vyF+R8EBU5dGK
         FTAHB7NywEc18BSiQ0otOOrrBCFTna5wmUW2PRjfTrgmwYNQlRUYX3miMqeVKjbF2j8W
         vMGw==
X-Gm-Message-State: APjAAAWNdBk/yn2ieo2bU+yBzMK/YaWLfGE8PWYSg9BBXhzZWek4Z50s
        wapMoqj53wz68fW3/df5vbU=
X-Google-Smtp-Source: APXvYqxijyLDWeojklGuekPg7cBgUDjoP+ludZ4sS6o8tRJx8SSCYSsfSBvSV9G3I29yplA811sMLQ==
X-Received: by 2002:a17:90a:23d0:: with SMTP id g74mr4854832pje.115.1565917503338;
        Thu, 15 Aug 2019 18:05:03 -0700 (PDT)
Received: from [192.168.3.4] (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.gmail.com with ESMTPSA id z63sm3719077pfb.98.2019.08.15.18.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 18:05:02 -0700 (PDT)
Subject: Re: [PATCH] dvb-usb-v2/gl861: fix wrong memcpy
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <98cb0a1c-0db8-951b-80e1-12756678db9a@xs4all.nl>
From:   Akihiro TSUKADA <tskd08@gmail.com>
Message-ID: <6c2806fe-f104-84bf-21b8-21df9b3112cf@gmail.com>
Date:   Fri, 16 Aug 2019 10:04:59 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <98cb0a1c-0db8-951b-80e1-12756678db9a@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Does anyone have this hardware? This device must have been dead for about
> a year, ever since commit b30cc07de8a9 was merged.

I have one. (and I wrote the patch).
Since I do not use it regularly and
my app did not use the return value meaningfully,
I have not noticed.

regards,
Akihiro
