Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D355E704C65
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 13:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232971AbjEPLc4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 07:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232960AbjEPLcz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 07:32:55 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C10E10CE
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 04:32:48 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34G8lXGW014940;
        Tue, 16 May 2023 13:32:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=selector1;
 bh=dEp4DVUuWi1dXZZLXj4MSygDs3+AeyztjUQ/XIvfeqU=;
 b=4WZshgTkecwoE3+9fMSiATxmmuL8jGzamrG4VaXe13+Qo0TjbVUKyshASg4yqa0mf+aV
 ndq22ZVPVYzdGtljg1o9v6YuF0P6D8RVlsaSR1xi5MfoM+04sZP/qESYzyQzIfSGpwAm
 vTQSpj4PO2kF1aCRQhJ0Wa3ZoLlcBY0jkp+ARyB6dCYcPHpSGwsG3BTPiZFpZ76MCqUz
 dUs8jsd9nOSpSjcWUP0J6LoOLwTLA4vXCIWBs10uDwLyx3E+xBPdqYtpVojNVwW7GRHm
 6H0blE9a9LyvEM5gFP0DFapPmJmKrLxmm1su70P7y/zU3S+KIW3JClnh+Nfj2kM/TqSw Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qkhp0g8b6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 May 2023 13:32:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C2D8A10002A;
        Tue, 16 May 2023 13:32:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB4892248A4;
        Tue, 16 May 2023 13:32:46 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 16 May
 2023 13:32:46 +0200
Date:   Tue, 16 May 2023 13:32:41 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [ANN] Media Summit June 26th: Please let me know if you will
 attend
Message-ID: <20230516113241.GA3045590@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <aec8b9e1-25d4-d0bc-63b6-68ff06e06683@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aec8b9e1-25d4-d0bc-63b6-68ff06e06683@xs4all.nl>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_04,2023-05-16_01,2023-02-09_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

thanks for organizing this.  I will be there this year and would like
to attend the media summit.
I don't have specific topic to present this time.

Regards,
Alain

On Mon, May 15, 2023 at 04:34:20PM +0200, Hans Verkuil wrote:
> Hi all,
> 
> We organized a Media Summit on Monday June 26th in Prague. It is held
> at the Holiday Inn close by the conference centre where the Embedded
> Open Source Summit is held (1).
> 
> Holiday Inn Prague Congress Centre - Meeting room "E"
> Na Pankráci 1684/ 15, 140 00 Praha 4-Nusle
> https://www.ihg.com/holidayinn/hotels/us/en/prague/prgnp/hoteldetail
> 
> We have room for about 20 people, so let me know if you plan to attend
> in person. That way we know how many people we'll get.
> 
> Regarding remote participation: only if there is really no other way.
> Meeting face-to-face once a year is important IMHO, and attending remotely
> is a poor substitute. That said, if it is really necessary to set something
> up, then I can do the same I did in Dublin, setting up a Webex meeting.
> That worked reasonably well, except that I will need to bring a better
> speaker since I learned that the laptop speaker was pretty bad.
> 
> If you do want to participate remotely, please let me know as well.
> 
> I'll post a separate email with the draft Agenda for the media summit.
> 
> Hope to see you all in Prague!
> 
> Regards,
> 
> 	Hans
> 
> (1) https://events.linuxfoundation.org/embedded-open-source-summit/
