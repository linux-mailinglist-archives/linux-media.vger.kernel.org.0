Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCAA371D7
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 12:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbfFFKiP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 06:38:15 -0400
Received: from ns.iliad.fr ([212.27.33.1]:57218 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726040AbfFFKiP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 06:38:15 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id C488F201DB;
        Thu,  6 Jun 2019 12:38:13 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id AC9F220D84;
        Thu,  6 Jun 2019 12:38:13 +0200 (CEST)
Subject: Re: [PATCH 5/8] drivers: media: coda: fix warning same module names
To:     Anders Roxell <anders.roxell@linaro.org>
References: <20190606094722.23816-1-anders.roxell@linaro.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <2690138d-b7dc-556a-d508-05e7dbb99ae9@free.fr>
Date:   Thu, 6 Jun 2019 12:38:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606094722.23816-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jun  6 12:38:13 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/06/2019 11:47, Anders Roxell wrote:

> When building with CONFIG_VIDEO_CODA and CONFIG_CODA_FS enabled as
> loadable modules, we see the following warning:
> 
> warning: same module names found:
>   fs/coda/coda.ko
>   drivers/media/platform/coda/coda.ko
> 
> Rework so media coda matches the config fragment. Leaving CODA_FS as is
> since thats a well known module.

s/thats/that's/
