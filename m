Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87A5515D53C
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 11:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgBNKJs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 05:09:48 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:49673 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729020AbgBNKJs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 05:09:48 -0500
Received: from [IPv6:2001:983:e9a7:1:f887:140a:e9b5:d382]
 ([IPv6:2001:983:e9a7:1:f887:140a:e9b5:d382])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2XurjHaor8i432XusjPJt3; Fri, 14 Feb 2020 11:09:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581674986; bh=8Ti0KhMFQwB/nVa+ukwF2aMKT5UCUAiKPYykBMzCplU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BhvUgBiA09wRrXPz8avHgAKOO4m/bEEggXXAdJNSt+NPnt4oKY2ZvDY8cYAUHyns0
         J40lEXNBEoMszG9m8GYjFe7Nu9DE2zVs8TNrVuiiDQvnoQx/TmkqRH2oByiy9QE5fk
         sHkslnZUN+A4HK5KpfXgKQspZoYCgFfskzJa6dVwZ1OidwJFtd5ZHP7Qo/g3dMEMJb
         9yofzs3LgBihvG0AxS3eKpEZIgZLvnrD821wk/3P76i+UuvsJWj0W+bfkGQuKGomFN
         T97vHSxm+Dm1mvyTTfvRvPCE/YsGAQ3UOy0P2+KZCOMTyTE3XOVYu63qSSWRg4mcJL
         nskS334YzA5YQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC] usbvision: deprecate and remove by end of 2020
Message-ID: <7892fff0-853d-6535-f1fb-08caf7e63ec0@xs4all.nl>
Date:   Fri, 14 Feb 2020 11:09:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF9/cIQY9YFr+YljrsF3ylZtocFFvQPrDqt9KOXYSEHRbZg+LyxeaXAVA1krtHNM3s467GWQi7/QIzGSv/6CrI4MZneeMipfNQbyK5EA054D3gCvvB1e
 0Qh/40IjEhzdv8V1FGOCJ/NTbmu5ZlttxBlpSRV2EwpfF6aopneUmux3CahoygS6Oy5TUglVpSbFmAOW9HFhA3FMw6m8v6oBjL4U/pyA4a1RwbrA5uZO1Lpj
 a/lv3BevTfN+Kz2SoaUmBmghTRKvBwPDaK6cF5YdHc0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

The usbvision driver is for really old hardware and is a big mess (always been
like that). We see a continuous stream of syzbot bugs because of that.

I propose to move it to staging for 5.7 and delete it by the end of the year
unless someone steps up to clean up the code and convert it to vb2.

Any objections?

Regards,

	Hans
