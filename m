Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEC85D9B9
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 02:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfGCAvv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 20:51:51 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54964 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727381AbfGCAvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 20:51:50 -0400
Received: by mail-wm1-f68.google.com with SMTP id g135so390564wme.4
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2019 17:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U54YwsNtS2uRPTkuyBTbqC0eDJkz/d3esOWtzB3Av64=;
        b=VN8cXQDFekyhZ4VDkuevxKKKQQYzJwphunhiMyB4eGeouWunciaEyHqTDwK7boebEa
         AGzfidcFdOpjOlmwAikuYrCsXazbMiexAiJ4QQ61V9P+Ly3IU24J7cB1FCkTVrBiJamg
         FwU2mnPpOY1TMDzeZj+etaDMT3t5eW42jG8OD2JayMdqtDiwbNwmXoWTOe2R7/edzWU6
         GDuzIhc4pVsgpIhOih8+kWUjhgge1JHjmua01tib2crxKe7YE4MekI3xAhGN5l4lv1UD
         b40wfQnmHGL13HZMVHo6gDWd4MC3gEtP5ni/SVh6b65gpFz2l1JyHhKqRlq6byVTfIvB
         Ubow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U54YwsNtS2uRPTkuyBTbqC0eDJkz/d3esOWtzB3Av64=;
        b=dTl1lfPrzuIZJWV0qAgwvLzbved8CsgscUZUmRyLPA6DUpNfhPz2WSgG6enXEKl/0h
         oVm+TnFYc4ccmccmtM1HA/mVg10j7Re5sqqK0eWf8haGo+6QJp5HdTmlWaVJKzW7hi/C
         BFK7VVDM9ByYfZRBpfoDZwwz/dMLtAo2+HLbdhuIswDebBynjAgLgFEUD0iM9Ix9h2nZ
         lR/yKsyVca2xe5gFyXKafroJ5rp31xS/FFN/L6EVFIiRvZsRbcGJfgC8BoITlAk3CqE4
         sTLJfdkNAx6yPkh92mHeZt+qK0XUXvowQ5U1Ou1V7AcMI0lgWG+MqmRFaO2wZ+vR3eE6
         8zSQ==
X-Gm-Message-State: APjAAAWIXNExTKOozdxEE+QZ9KMgv6VX6lEqYyKLy+T9t/NYDbj+C7D9
        lzVqSG9qXGuH7jIMuSpVZjxf3aDN
X-Google-Smtp-Source: APXvYqxwxNtE7wdsRIJTLLwUWTTqo0weVAfJMvRtxd8DrmfVCld8+U1ssljmYDRvtTOVnBs2/L7WtA==
X-Received: by 2002:a7b:cf32:: with SMTP id m18mr4859007wmg.27.1562106600494;
        Tue, 02 Jul 2019 15:30:00 -0700 (PDT)
Received: from [192.168.43.227] (188.29.164.238.threembb.co.uk. [188.29.164.238])
        by smtp.gmail.com with ESMTPSA id h19sm511471wrb.81.2019.07.02.15.29.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 15:29:59 -0700 (PDT)
Subject: Re: Keymap with duplicate entries
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>
References: <7d2bf66655bfdaeeea45ef0878e7920b485bb120.camel@hadess.net>
From:   Malcolm Priestley <tvboxspy@gmail.com>
Message-ID: <2b07545f-94b6-7c12-e569-0e0a341b961a@gmail.com>
Date:   Tue, 2 Jul 2019 23:29:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <7d2bf66655bfdaeeea45ef0878e7920b485bb120.camel@hadess.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Hey Malcolm,
> 
> There seems to be a problem in  the keymap you provided for inclusion
> in the kernel.
> 
> In media/rc/keymaps/rc-it913x-v2.c, 2 keys are triggered by the same
> keycode:
>  53 ↦       { 0x866b18, KEY_VOLUMEDOWN },•
>  55 ↦       { 0x866b18, KEY_CHANNELDOWN },•
Hmm

I don't have this remote only the first one in this file.

I am pretty sure the values for the second type were forwarded to me by another user.

Regards

Malcolm

