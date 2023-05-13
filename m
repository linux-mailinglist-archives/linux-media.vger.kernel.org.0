Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4108701686
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 13:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236262AbjEML44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 07:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237878AbjEML4y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 07:56:54 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B90E1FF9
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 04:56:48 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4QJPHd60BXz49Q2p;
        Sat, 13 May 2023 14:56:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1683979006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pJ65ShwSB5gw7LDnHjCN792C7mxZdQ/Vg9XtWSU4Z2s=;
        b=LNptTY0NtTEmtp0q4DHAlnLfXGv60TAzjTu65/YNJWMmtF7hAwdcFy4/pbiJvpo9GnFxct
        V8iHLKjGi9IbUAMtM3fqlHeHzVGvJOwSLGhmrFGUihZIDaYwk0kA+YS6wwtTUpSvIWkgGq
        iTMKbNq/IlVPzo5eQbKZRUY36U1H+al/48w3OQfWtri9R64FniMaKwi55plsFMi5QqPKDu
        cCtjVhlA11jHFxRUmgN5SBSKFvvTeS4GF8FUn19xvOLfxojBdurcGKBYXNJ9+u/1AFA3nW
        nfpUMQhjURFfOZFVOUOzmOvB5KMpZcbvGmupR6BMG0/oQSlRktcpEYMtjCscTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1683979006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pJ65ShwSB5gw7LDnHjCN792C7mxZdQ/Vg9XtWSU4Z2s=;
        b=uSVHP9HcOu6YdazbaQBndVNET8aVGcmhm0onyNkFJuP8osiEei9nQ+qQo6JSrJy5PEUlxe
        G557XnJJd5OI8NmTpj6NwHCvMCmphZ8f84ezdapPp001VSZ1AHyj4LppVjJLz+QE3XWGvY
        BGLkNR6cz9QsjQAwOMtiQgnBYcnNJwFfi0LyHSZ6bnvSOfl0no7fYch+dOT32PDW+nL4Wv
        FE1cKcz+qk1qFk4f1Goje3ypnZ/4wqoLxeHIcYZg8LgJ1Abzb6eO9dj7fTlAj3m7xPyeW/
        ewcorWH0wcq+KejqGoM6rgZKQt6z9XAdv4Nl1ZS/84W5lWsI62ji7BrFIo7YYA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1683979006; a=rsa-sha256;
        cv=none;
        b=a1TcBCXPo9+1cPpmRGDXtgWO2mtmFRzDhhP258tT5Qe/fVJWhmsurlJnH8aVNV4WZvgXXx
        r92i/HAiCZ51dgiKc19LJ4/XmJDMp94rRKMZnE3v8Q7Ks+ymjb6S2bU4zmwVRuav8+sduq
        3iH3lLCtMDhWgyKuRBymWg3cTHm9eLdrRQI1U87Wjw2oCg2bqULX5f57QWMgrAp1dISEgk
        Y2x1qwXDC3h4YXVVNBcG6quYHRth6AbWeQYV3e7W6SJQ3LQaTL8afHTBxonwtW0xh58YW2
        7iV7yJmP2Y42IT3p27BA72057bjnYfW4Z5RuVkr7c52JE5L/c10PqFT7tWAzvw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 38791634C91;
        Sat, 13 May 2023 14:56:45 +0300 (EEST)
Date:   Sat, 13 May 2023 14:56:45 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [ANN] Request for Topics for a Media Summit June 26th
Message-ID: <ZF96/ZebSx7eaABw@valkosipuli.retiisi.eu>
References: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Mar 03, 2023 at 03:44:00PM +0100, Hans Verkuil wrote:
> So, if you have topics for the meeting, just reply!

Thank you for organising this.

I'd like to propose to discuss generic line-based metadata formats in the
meeting:
<URL:https://lore.kernel.org/linux-media/20230505215257.60704-1-sakari.ailus@linux.intel.com/T/#t>.

-- 
Regards,

Sakari Ailus
