Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2026155DF8C
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233188AbiF0KA5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 06:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbiF0KA4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 06:00:56 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17986252
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 03:00:51 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 12E6A83EA0;
        Mon, 27 Jun 2022 12:00:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656324049;
        bh=LFdN9GMwGqpPTUOAUDct3x2ZdhKFEqzd7C//1glzWQE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jUF6DNzfBPQ+xNNgwSlnEaSNq4sqOE5vlDKpQfn/ssBLBViA0YWf0kb8RkZWybhu+
         6czX5gW8imlQZrbmzErQzsBWZZwauMl42mx8l3K6CHoGDkSauGk3iq+364V/IvH2E7
         Q+A+GuvPcYbLStl+WnM8qNmH0wYbIAcjX7Jsj/tBnCLKbyVPFHWH/2OBp2g+xGE3X9
         lmNKNQo9LzehEDyjvmUkFUJJzqNGUoy7bu/6SAbiBjBF51RsFzWcBlldwIGBVbjY/J
         LLj3ui0AOlfrScu/w7J3TV/j93j4c/tYxEsoWvMHpZfWpnJnQHtC/gpV7udORZZhGB
         PVjHYBzIf8NdQ==
Message-ID: <ebc7ad60-9f82-5b49-162b-776f7bc348e5@denx.de>
Date:   Mon, 27 Jun 2022 12:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] media: stm32: dcmi: Fill in remaining Bayer formats
Content-Language: en-US
To:     Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        linux-media@vger.kernel.org
Cc:     Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220618222317.478187-1-marex@denx.de>
 <38af38b8-48ea-cfd9-6532-856b594735ca@foss.st.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <38af38b8-48ea-cfd9-6532-856b594735ca@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/27/22 11:39, Hugues FRUCHET wrote:
> Hi Marek,

Hi,

> Thanks for the patch.
> 
> Acked-by: Hugues Fruchet <hugues.fruchet@st.com>
> 
> Please note that we have not tested parallel setup with more than 8 bits 
> with this driver because of lack of hardware support.
> Which board are you using ?

Custom one with MT9P006 sensor.

> Are the whole 12 bits of the MT9P006 parallel bus wired on your board ?

Yes
