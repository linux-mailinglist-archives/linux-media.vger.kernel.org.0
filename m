Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D091E27FED1
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 14:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731999AbgJAMOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 08:14:35 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:33783 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731767AbgJAMOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 08:14:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id NxThkVIdGTHgxNxTkkn95K; Thu, 01 Oct 2020 14:14:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601554472; bh=jBrsdt/0uhjskCFZDWBaY0MDr2G2BowqvVjCa64nkNc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pqVIpo/onhAMrGuhDn9N3RdwHdig0MP1o6ydDjNrn+t6nb/IwFq+2QJMm5XxvBqhp
         LNlUnLPXcnbU3wsEFLPSV8/m77Iu5KF5ScPRYadG3wTIM+TFCmmMtIYY0AIaY1xprd
         RjY/DfaQQMzdZzv8OKHyWC4Whkfd54elm25uA/gL2GhPvYhjAoA/mQVfiv+XSj4fBD
         BRKm7W11MFwnKBRCt1BtsMo65prZPk0KMIGZ0dU6DQVc3vwQI+sAGuqSpnOLYQcTah
         QJWqVnvG2mSFd2Bp9OKTKR8x2Bl3jYD0E6CSvfBY87zqdyZ9XPt6G7NZhBkHqjiIM+
         VHQDrkptB6jDQ==
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: allegro-dvt: ready to move to mainline?
Message-ID: <608e0878-aaa2-425f-f453-8bf78d3e8fbe@xs4all.nl>
Date:   Thu, 1 Oct 2020 14:14:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAUVUQGm7CH1VvbJKEfRV6JETe5OWnsjnjBBi0G2gb+PR3HX0tyfE42qT+AtJurDLkgajq9fHiwpv8riffStb7p/V0PfFOi+YzMYLtgAl9eQWtSre0hl
 nbVcFgY0mgCTCYswbUKsj1ehhqOmxipAmuW1XbujL1c1qooz59sO8CWdnSss66JgYL3UDYX99T6VVIWy3HlZhNa9BxKSQek5LP0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

What is the status of this staging driver? The stateful encoder spec is now finalized,
so is there anything else that blocks this driver from being moved out of staging?

Regards,

	Hans
