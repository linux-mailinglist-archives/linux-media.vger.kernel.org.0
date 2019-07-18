Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4920C6CC0E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 11:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbfGRJiM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 05:38:12 -0400
Received: from ns.iliad.fr ([212.27.33.1]:43780 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727592AbfGRJiM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 05:38:12 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 99220205F8;
        Thu, 18 Jul 2019 11:38:10 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 82044205BC;
        Thu, 18 Jul 2019 11:38:10 +0200 (CEST)
Subject: Re: [PATCH v2] media: dvb: Provide 4 devm variants
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
To:     Sean Young <sean@mess.org>, Brad Love <brad@nextdimension.cc>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
References: <568760ff-08d8-6e7f-df35-cf76d4fcf945@free.fr>
Message-ID: <effb2781-8293-925a-0134-e071b3437581@free.fr>
Date:   Thu, 18 Jul 2019 11:38:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <568760ff-08d8-6e7f-df35-cf76d4fcf945@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jul 18 11:38:10 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/07/2019 10:56, Marc Gonzalez wrote:

> +int devm_dvb_register_adapter(struct device *dev, struct dvb_adapter *adap,
> +		const char *name, struct module *module, short *adapter_nums)
> +{
> +	int rc = dvb_register_adapter(adap, name, module, dev, adapter_nums);
> +	return rc ? : devm_add_action_or_reset(dev, unregister_adapter, adap);

Doh! This is incorrect. (Face palm) Will spin a v3.

Regards.
