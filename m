Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A26907DD42D
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 18:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343577AbjJaRH3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 13:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236386AbjJaRHR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 13:07:17 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D545C118
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 10:06:10 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39VE46JT018206;
        Tue, 31 Oct 2023 18:05:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=selector1; bh=HwierGgjUPx/44d2C0ecg
        +p04TuRyzUmDgvuKXnG+h8=; b=E8NoteQcvziSqgp6wTJjs3PpKoewvLdUowd3O
        GYoKyShC9WN+glt4b8HgcmKvAFlrxxrLeglWPW0fpg1KzH17pGcYY7ZKVNVN+zRM
        1FefRp3LcDIELwT4WXu/f2NkLuF02XrKZcrCwCfMhcAsz3QEzfTv7zp8WsTkek42
        co4PY2C45A44It672A83Q9vEbES/SQmO8ID8qdDuTRX/dIAlzNgbGlJlSxmkE326
        WDoku7U7xyEPTWN0Ll4vYKZLFxeZff+VhagnWUghILjnkdDPwt7hOQj04Gz0N46q
        pKRMlHvmjLBVJDhJ92zhAT42DOUeFdGDKIszV3hJX5xt0Nomg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u0tufe7nu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 31 Oct 2023 18:05:42 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7497D100056;
        Tue, 31 Oct 2023 18:05:41 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62F6325B938;
        Tue, 31 Oct 2023 18:05:41 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 31 Oct
 2023 18:05:41 +0100
Date:   Tue, 31 Oct 2023 18:05:30 +0100
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <linux-media@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC] regmap_range_cfg usage with v4l2-cci
Message-ID: <20231031170530.GA2989927@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Hans de Goede <hdegoede@redhat.com>,
        linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
References: <20231030173637.GA2977515@gnbcxd0016.gnb.st.com>
 <962d6d0c-2263-fe59-011c-09068a6a4cef@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <962d6d0c-2263-fe59-011c-09068a6a4cef@redhat.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_04,2023-10-31_03,2023-05-22_02
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Oct 31, 2023 at 10:53:16AM +0100, Hans de Goede wrote:
> <resend with Alain added to the To: for some reason reply-to-all did not add Alain>

No pb, I also received it via the mailing-list ;-)

> 
> Hi Alain,
> 
> On 10/30/23 18:36, Alain Volmat wrote:
> > Hi,
> > 
> > Goal of this email is to get first comments prior to posting a patch.
> > 
> > Could we consider enhancements within the v4l2-cci in order to also
> > allow regmap_range_cfg usage for paged register access ?
> 
> Yes definitely.
> 
> Extending v4l2-cci for other use cases was already briefly discussed
> between Kieran (Cc-ed) and me:
> 
> The CCI part of the MIPI CSI spec says that multi-byte registers are
> always in big endian format, but some of the Sony IMX sensors actually
> use little-endian format for multi-byte registers.
> 
> The main reason why we need v4l2-cci and cannot use regmap directly is
> because of the variable register width in CCI, where as regmap only
> supports a single width. v4l2 cci uses 8 bits width in the underlying
> regmap-config and then takes care of multy-byte registers by e.g.
> reading multiple bytes and calling e.g. get_unaligned_be16() on
> the read bytes.
> 
> For the IMX scenario the plan is to add the notion of v4l2-cci
> flags by adding this to include/media/v4l2-cci.h :
> 
> struct v4l2_cci {
> 	struct regmap *map;
> 	long flags;
> }
> 
> And then change the prototype for devm_cci_regmap_init_i2c() to:
> 
> struct v4l2_cci *devm_cci_regmap_init_i2c(struct i2c_client *client,
>                                           int reg_addr_bits, long flags);
> 
> And have devm_cci_regmap_init_i2c():
> 1. devm_kmalloc() a struct v4l2_cci
> 2. store the regmap there
> 3. copy over flags from the function argument
> 
> Combined with modifying all the other functions to take
> "struct v4l2_cci *cci" as first argument instead of
> "struct regmap *map".
> 
> This change will require all existing sensor drivers using
> v4l2-cci to be converted for the "struct regmap *map" ->
> "struct v4l2_cci *cci" change, this all needs to be done
> in one single commit adding the new struct + flags argument
> to avoid breaking the compilation.
> 
> Then once we have this a second patch can add:
> 
> /* devm_cci_regmap_init_i2c() flags argument defines */
> #define V4L2_CCI_DATA_LE	BIT(0)
> 
> to include/media/v4l2-cci.h and make v4l2-cci.h honor
> this flag solving the IMX scenario.

I understand that in case of IMX sensors, ALL the multi-registers
value are encoded in little-endian right ? In case of the GalaxyCore
GC2145, most of the registers (page 0 / 1 and 2) are correctly
encoded in big-endian, however page 3 (MIPI configuration) are
2 or 3 registers in little-endian.  So far maybe this is minor
case, but the approach of having the endianness part of the v4l2_cci
struct wouldn't allow to address such case ?

Originally I thought we could have CCI_REG macros for little endian
as well, such as CCI_REG16_LE etc etc since we anyway still have spare
space I guess on top of the width part.  Drawback is that in drivers
for IMX we would end-up with longer macros CCI_REG16_LE(...) instead
of CCI_REG16(...).

Or maybe as you proposed we can have the "default" encoding described
in the flags variable and have a CCI_REG16_REV or any other naming
just to indicate that for THAT precise register the endianess is not
the default one.

Are you aware of other sensors having "mixed" endianness registers ?

> 
> We need to make this change sooner rather then later,
> while we only still have a few sensor drivers using
> v4l2-cci.
> 
> So back to your question yes extensions are welcome
> and we already have one planned. If we are going to do
> more extensions though, then I really would want to see
> the little-endian data plan get implemented first, having
> our own struct v4l2_cci should help with future extensions
> were we can then just add more fields to it if necessary.
> 
> I'm sorry about asking you to implement this first before
> being able to solve your own problem, but this should be
> relatively KISS to implement and I can test the patches
> for you for at least some of the sensor drivers.
> 
> > At least two drivers currently being upstream and using v4l2-cci infrastructure
> > could benefit from regmap_range_cfg.
> > The GC0308 driver is partially using v4l2-cci and partially regmap (in order to use
> > regmap_range_cfg) and the GC2145 driver is using v4l2-cci but doing paging manually.
> > 
> > The function devm_cci_regmap_init_i2c is already taking as parameter one argument
> > reg_addr_bits to be used in the regmap_config structure.  We could also add
> > regmap_range_cfg pointer and size arguments to the function or
> > alternatively add another init function with more arguments ?
> 
> I think adding a devm_cci_regmap_init_i2c_ex() would make sense here, this
> could already be done when adding the flags argument, giving only
> devm_cci_regmap_init_i2c_ex() the flags argument. For just the flags argument
> having a _ex seems overkill but if we are going to add regmap_range_cfg pointer
> and size arguments too then I think an _ex makes sense.
> 
> And then in v4l2-cci.c only have the _ex and have a static inline helper
> in v4l2-cci-h defining the non _ex version ?
> 
> Note this devm_cci_regmap_init_i2c_ex() variant is just an idea /
> suggestion I'm open to discussion about that.
> 
> To be clear if you plan to implement the devm_cci_regmap_init_i2c_ex()
> variant, then this should be done in the first patch adding the:
> 
> struct v4l2_cci {
> 	struct regmap *map;
> 	long flags;
> };
> 
> bits, so that we don't have to add an extra 0 argument for the flags to
> all the existing callers of devm_cci_regmap_init_i2c() in that patch.
> 
> And then a future IMX driver conversion can use the _ex variant.

Yep, agreed, devm_cci_regmap_init_i2c_ex sounds like a good name to me.
Let me prepare this and I'll post that in few days.

Regards,
Alain
> 
> Regards,
> 
> Hans
> 
