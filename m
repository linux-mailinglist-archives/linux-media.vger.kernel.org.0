Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52C1DC30A0
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 11:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfJAJvL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 05:51:11 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55509 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfJAJvL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 05:51:11 -0400
Received: by mail-wm1-f67.google.com with SMTP id a6so2554833wma.5
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2019 02:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=bgCOSuTDrnIofbH8Wk6z2NUJMAOXnR2DEmA0mheIh04=;
        b=Lsvh1c6mjwUmqbRPtRlHyIcQ1OYvnBmA8jYjHL1JHDD6NJSFP//CwJoTW3YOqdyxzY
         MTcuGZavSJdLxGuzulaD64M33R6cVRZ5fIS8b90fiM+8OFw6jwSj5u8ThERLvn7rZxvf
         UgJqVy0wmJALBl2i0lbP05SYR4iTzZLlcjJFyR4CyEMOcHWH+zlpt90O5ltB6kepKswz
         lXBOIRiXWt9ChrqOe6oQ6fAsd4nKO7gZtg1R14JjDP2k9Rx5RkXnHgCUK/51FTvczoim
         FG5XhXgCWRUE4InVtCsfuS55cQ4JtBGtFxXNr+bGELluILF01ds+RnqoEhgDC4ZFKzc7
         B5Mw==
X-Gm-Message-State: APjAAAWHZQm2DhF4sn6/aE/BNunk4iMCHAkCqJKkmSONQDq2M1LGejAC
        AVkPeLz8JLrS4IiK0aMgt0BTdxnz
X-Google-Smtp-Source: APXvYqyTDB0NaVsFMnXoxbtnBmCy5R2K6HbKYZ1kP9zwEFAhjiXTmSJvb+rJyLAs5JNhki+tQTXiBQ==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr2864538wma.19.1569923469202;
        Tue, 01 Oct 2019 02:51:09 -0700 (PDT)
Received: from ?IPv6:2620:10d:c0c1:1609:54:45db:20c6:d537? ([2620:10d:c092:200::1:486c])
        by smtp.gmail.com with ESMTPSA id r18sm2673421wme.48.2019.10.01.02.51.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 02:51:08 -0700 (PDT)
Subject: Re: [PATCH v2] edid-decode: Avoid division by zero
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
References: <cc88ca6d-5608-5381-74b9-008c2a32afb3@debian.org>
 <ca1fd80c-02d1-f793-0906-239f020eac65@xs4all.nl>
 <e9bae40c-9a2c-067b-d547-cd1f1a528e25@debian.org>
 <3f362e23-7cf9-e93b-8c88-b7b6c5197230@xs4all.nl>
 <94eae8a9-54bb-8110-b6b8-ef4bca2e7fc8@debian.org>
 <7e7e8c4c-528f-e87e-739c-af8aecbf0d52@xs4all.nl>
From:   Breno Leitao <leitao@debian.org>
Message-ID: <a1c00815-b3ea-46ef-4415-db4bc6c6649d@debian.org>
Date:   Tue, 1 Oct 2019 10:51:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7e7e8c4c-528f-e87e-739c-af8aecbf0d52@xs4all.nl>
Content-Type: multipart/mixed;
 boundary="------------83FE69442BF4ACC1843597EC"
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------83FE69442BF4ACC1843597EC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 01/10/2019 10:26, Hans Verkuil wrote:
> Can you just mail me the raw output?
> 
> cat /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-HDMI-A-1/edid >edid.bin

Sure, here it is.

--------------83FE69442BF4ACC1843597EC
Content-Type: application/macbinary; x-mac-type="0"; x-mac-creator="0";
 name="edid.bin"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="edid.bin"

AP///////wAVjwBG8HIAAB4XAQOAZjl4KmCdoVRJmyYPR0ojCACBwIFAgYCVALMA0cCLwAEB
AjqAGHE4LUBYLEUA+j0yAAAeZiFWqlEAHjBGjzMA+j0yAAAeAAAA/QAwPh9QDwAKICAgICAg
AAAA/gAxQjJDM1AwMDQ1MAogAaECAxtARxYxBBkBAxgjCQcHgwEAAGYDDAAgAIABHQB8LpCg
YBoeQDAgNgCiCzIAABoAAAD3AAoAyuBgAAAAAAAAAAAAAAD8AEVMTyBFVDQ2MDBMICAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwQ==
--------------83FE69442BF4ACC1843597EC--
