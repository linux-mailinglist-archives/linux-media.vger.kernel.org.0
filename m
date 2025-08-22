Return-Path: <linux-media+bounces-40705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 517FFB30BC7
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 04:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AD7C1D011D6
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235A01ADC69;
	Fri, 22 Aug 2025 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eDXuFd+P"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C311D14286;
	Fri, 22 Aug 2025 02:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755829215; cv=fail; b=mrgOo3qLskFWaOYlAFGnWJLt0qYv0FtqkZ3j+r0qUfpZwXrgBcJCAy3yRyaCxVTcL5SOttkCMHSzt6t0z6dPn8Jkw5hFatyKjVs8Rr++kdUst+Gst2hYQ1qB58pw274VrOD3e63XP9EkcqSxPhaYwpuvmaMupRrCDd23uOzXMzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755829215; c=relaxed/simple;
	bh=4I0KKEWJPMMfNHCU+UodKuUro3+MHWfGz7VoLTM9ZHo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qqN+fIcqegIL6CQeO27TVl+eiQJLle1s354l7UAuN5iStaY2atSXuhtpuuz5cbp+cib7AlR7S5RkqQQZy/yVTm0OifIsf/yj6q3nSICivpCE1sI8I3bDLfQZh+XFgusqgfo28O3LixA/81kX/aVezNONUamcJNuCSPNO1ErhcqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eDXuFd+P; arc=fail smtp.client-ip=40.107.94.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfAs203VEgXbI6434UAtXoctJFALNjgubLLmy7Y8/GjEhSBwQl9dOL2NfLTvW91YyLe7g9aWYNFHAgPIgcypmXPuSRcvDmOnX5YR7WREKgkG8zgVpqkMXvU22AE5oRF+zqf6hSXkJxfpxMM+EO7zbN6LddkRafIRX7GZVGOCj4OwVYM291Ya6Rly9PCnHPFcDQwJYVW5RSbGhrcFSVF55wIx3yjeR4lKuY1gQlCoTMDyqugc1b97YrqteuMoke1GDADLxK2ikNCIZuuyd0lLHeZ3XL3LNvZmB7KzSUiWKfp36cll7fQUxZbq+zbDzUqHoGgOkJ8CfoZt8H51JbTa9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QepJcqod2WkFleRAxKLfCGwamgZj+EP8bH+N8gW8+lg=;
 b=OrJI4QDo0rEbnEb19euAcyHFYHeuzFJ76JLdo91uEja64bsc4xPLc/Nz5SLI3/f1f6n2BrBdtFkmujFY4i4OzIX+bPkZyhqy9fMMpCrXKAZjiOjATtVCPTz5tyxxxEngqlnlBSShhP/LOTJ7oE+6T7uUeCievkI7EUZMevLHaJVtML6nAO8OZzdZqYyWn2CKgMN1pzZUNMWpl1ptJmdj9LBPiRNgzIh2jRXHuQvcCah8gJ5GcsU9fU0RhrlYzf9/OFn+ZQv/O5U6CAELzjdfLRy/CUlU40OjTDfaBf3rFDpPoXxBfe3zl+ig46bHy5rOfs0t5LO51E/Jk2JfYtUdiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QepJcqod2WkFleRAxKLfCGwamgZj+EP8bH+N8gW8+lg=;
 b=eDXuFd+PnWVmGxybPHKM9sdVv3UqUVsz2Bd9s3QdeVqOhB5VchGldJNgFgYwB4KfwgdumqrtBUmtVGCtyGAduDdEpKN1vJj62P2C84GDJtH+s/gZ2gOrIz1IcjrR4aVPUKN+yJW8LlnRI+Wobfsf5IVCbWOHE4f0XGi6d+Z2YZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH7PR12MB8154.namprd12.prod.outlook.com (2603:10b6:510:2b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Fri, 22 Aug
 2025 02:20:10 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 02:20:10 +0000
Message-ID: <63949b3b-ca2d-42aa-bc8d-43f2952d307a@amd.com>
Date: Fri, 22 Aug 2025 10:20:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] Documentation: add documentation of AMD isp 4
 driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com, bin.du@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>, Richard.Gong@amd.com,
 anson.tsao@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-9-Bin.Du@amd.com>
 <20250805113719.GF24627@pendragon.ideasonboard.com>
 <e614b565-81e0-49c0-93dc-af1936462728@amd.com>
 <aKXC0Q4IiKmkjoSH@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aKXC0Q4IiKmkjoSH@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0195.apcprd06.prod.outlook.com (2603:1096:4:1::27)
 To PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH7PR12MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 299712a8-ac1a-403e-0ea7-08dde1226afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWVkN0hNKzk4S2o1ZzVwVGd0RzlyZnArWW9NV3hEa0ZXSk5XNFo3TndVT0Jm?=
 =?utf-8?B?Ty9vdkxWbWU0dzhEMkM5ci9QdXUrdmEzUUhIVFdRaFNRUnM2RDdoMlM2cFBG?=
 =?utf-8?B?V2xBSlJNd0ZVZGlXS3pUWTNwMmF1VFhJeWMyeWFjalh1dENxT2ZQRHprT0Ex?=
 =?utf-8?B?UFZqTHJHUFZtblB0MWc3eE41SzYxS3NsL09pRDVYVlNiVnZwQ3VyV2RZNEpa?=
 =?utf-8?B?ekt6T1REM0hHY3VhdWk1dmZMd3FJNCtQM0JVK0x1WmRGOUFhWW0reFlMNDU4?=
 =?utf-8?B?Z01GZks2TS9MTFBTbGgrVU5MR3o1VDBDTGtyajJzTFFlK2h0MzBjU3lsNTFm?=
 =?utf-8?B?MU0xcWtycVkxYVhySVlPK2dSeU9CWnJDdXhDNldFK2V5SjJrcXczZmVhYXRn?=
 =?utf-8?B?Z1hiQlVEbkE1YW1pWGVNcmMzbmRCVU85enFqbXRJUFlXU0hhRnh5a3Rxdi9V?=
 =?utf-8?B?QzJQMGd3M1o0NERIMHJPQmlZTkZIVTNGOWcxM2ljUXhDS0NvSmlwU1NRMXhM?=
 =?utf-8?B?MUovb2VNTWQ4TFRWNkJGM1pRdnRhWVJqazNtY1JCbWNWRjh1Sis1eTNzQmtT?=
 =?utf-8?B?dUxDbVdaREtzUWJFYS9qTUJNSmJQR3kvZWc4YnRzQUJ0OGFtTXgrc3FENGo3?=
 =?utf-8?B?VUU0aCtpU2N3RkdWMllVRy90cjhDVTNPenRKWTZTT1JDbndlRU1Rcm9ad1dG?=
 =?utf-8?B?dWJiSWFKSFVJWG1aVThWelJRTkZUYXh3VFVXQTZKMmtUN2dlSDJsWVp4UzJj?=
 =?utf-8?B?TU05ZGhmZ3RkVmx4VXBmOHo0ZlJMR09pb1R1QVBDN2VMaU9odFFkM0xZcWps?=
 =?utf-8?B?OFhFNDFDTERnK3NPS0U5c1Q5VDB4aFhneGFDZkRJdGxra09SaWxwc1BFekRC?=
 =?utf-8?B?bWFCSWphWmJTallydzJhT3g5WTBQVUlCS0o5UDI5YVNEaUZkRlFRMWh0azlG?=
 =?utf-8?B?TnBZaWxSakdXN3ZqZ2lRS2dOUEFrenJVT2RmY1NadmRDQjdxb1pvTnAvS2dM?=
 =?utf-8?B?Znk2Nnkzc09JNHlXckdpRUFkd0pkSmsxT1BXL2I2ZXpiNWI4SVZtOGZ5Ykh1?=
 =?utf-8?B?MUFmNFM3bTJQV3dKRVY3cWtobGJrMWQ1blhBT25kcGhxNEhrSCtOVkxnbUpU?=
 =?utf-8?B?S3RPWjZSbTRubzNjalErZUJEVkhHb3ZOM1IvdHM1MHRudXJRMStIdCs0a3Ry?=
 =?utf-8?B?RUJMSUtXZytHTW9BSldMOU9Mb011a3pXQU0vNFY3eUNpQlpNM3REaEdIU1Vz?=
 =?utf-8?B?dWw1VUdDN21vRTBKK1JpdXZTQnpFamluK0JRSVcyWEJVMUJmZDlKRTFSUTRh?=
 =?utf-8?B?WGFXaklkQmd1c25uVGt1bExsZU5TWmxsNTQybXJSN3lKLzNBT0txVkRud2tz?=
 =?utf-8?B?eTZQU2NPVDg4SzV1REVXU0JKbFNLeG4vMlNJdCtIaHhndVJSaGNoYndmVjh0?=
 =?utf-8?B?eTFyRVZsNUtTc0QzZE5TaWlLWkFVV3F5a1c4aG5jaEQydE1iVFRUU25zZ2pD?=
 =?utf-8?B?NFRQM3Y0SVpFR0N3UUZkTEdhRlBWRmxpRTRrS0VmQ09GaWVnVHMvU0lPVUxm?=
 =?utf-8?B?Q1l6NEFlSW9IL0NNL1BCTkR5eGFBcmFGSC9JSW9LMkpiUGtsWDd0TXVWVG9Z?=
 =?utf-8?B?SnN5ZFJsSllqV29IMWpmZEIvN01uSjdUVThDRmd0ak5FTE5Wd2g1ZWpleTdB?=
 =?utf-8?B?ek5Wb05iS0VrN0wwTDFZWjlIM05vZHl1TWRFU214TWMvRERid1JOaGtZTnlr?=
 =?utf-8?B?bHJ1cmFMOVFqKzB5UnVFV2xKTnd5VHFCKy9RTUl1dG1nUXFEbk8vNFR4L0h0?=
 =?utf-8?B?V3V6d0FNVTRGN0F3MWFIZTM0ZjdjVG9HbHgrN3NROTZ1QXNZdGJSaU9FMnV2?=
 =?utf-8?B?OEp6WlIzaUJKbVZLSzQ1UG9SMzNuL2Q0TmR4M1FaSVVCSkMxRENVN0hDUXdM?=
 =?utf-8?Q?opSBlQ5aa0g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RERFcWdGZjdROVl1RmtiTFNwa3Z6V0ZpTjBRdENkRFFRRTRVL3NmUjJPYVBw?=
 =?utf-8?B?S3BLRDFPRmU5b295WldPUnl2OVNvNjhPbmJKUkFML1RYTjQ2ZTdRMUdEcGwv?=
 =?utf-8?B?UllLalJJNUIydUk2MEg0VjVwaDdtcCtaR0lvVnlQK1Z1d2tYWCtYd0pRd3dt?=
 =?utf-8?B?dGdNZTNvQmFTc1M4cHFuUWJHQUdSZVFJMWxYMkx1ZURod3RkQ0x0bU1BNVhM?=
 =?utf-8?B?SFdVZFpVSG1kTmRtUlE0ZERGZ2dpNzBXUzFvS015QzNPb0s0Z25haXoyY2hP?=
 =?utf-8?B?Z040QnYveUZFK3NZMjQ0TUlsdGhCSER0NTZudHV6MzhJSEF0WVRJZENWSlMv?=
 =?utf-8?B?WFVUc1FzZmRzblFLeEhkNkFmZTAzZGhia2lsc2FlUjNoQVZUNms5cmtDQTJo?=
 =?utf-8?B?NmZlcTR6ZHJVYlJSSEdJTjJnczFUOEdYRkJyNW5CQlB0eHdaTGZMcDdmRW5G?=
 =?utf-8?B?VkxFL0VoeGJqdk1reEhjUGhBUjNVL1ZROU9Nd0gwWTlCSFhTVlFRVVgrTnVB?=
 =?utf-8?B?ckRFeUJObzNrSVpNNUxjKzZJQjI4aS9uR1QwbEhIMjRuWmhLT25YeVBvNjB2?=
 =?utf-8?B?cGNKM0E4NWJyZ0hmVEllT3Rra1dVUzFLZW9ZVHNjRjBtdXdlb3RybCtLemRR?=
 =?utf-8?B?KzZFWC82bnlqSXZlWXZhbnhlaDZiMkdxaGs0SUkzNnYwcmhlNWxXck9WNllk?=
 =?utf-8?B?WkZ5V3lJK01VZFlJTElGT1I5T0duTVN3N0k2clJnUkIwN3NKdloyMGZRckpM?=
 =?utf-8?B?aWMweVZseWdKcjFPdDFVUjZCaGhuTE1CcjIrU3FmbVpXeXNWVWd5c0xiZFQr?=
 =?utf-8?B?SFhPdHJHdWl6NStUTzFjdjRHTmFsd2M5bU55WXd2TmcxMktLN3dqOGVqc0t2?=
 =?utf-8?B?eFMxa1NQNnROT3V6RHVNaitDUzl1OWpKSTRSeWNzcGk0anF5WmZCbHBzZjdz?=
 =?utf-8?B?OXNxZGRLc09MUlhSWEUzdXB2MFhuVzBIL2w1YlNsSWVGc3dXV0k0VUVvVytN?=
 =?utf-8?B?dnFnQ1RyYkFwaHBQVGVsQ1NDQ2pHZE9Yb3J0dmlYQjlPZ0VlQkJxRzlBUXZy?=
 =?utf-8?B?clpEUUJuczhPZ2djaEgybVErbnM3eGtDZk9ndkVMYW5sRk5ZSlY0MXNOZHQy?=
 =?utf-8?B?anZvQUo1azQyV1I1VTdSZFRrVUNjSmoyQnE3eDFzMjJQZWdLZXRYNzZyWWFu?=
 =?utf-8?B?bjdMaE1FdWtOSzNkaTlEa0gwM0tUWkdlUHMzKy9meGFLc1FKcTNxTXVFT043?=
 =?utf-8?B?NjJyeHdqUk9SczF4UWRNU0lhbDdGOEJKZDR1aWpFbEVjRTh2dm5TeWhXVDVE?=
 =?utf-8?B?UU83ZTFZaEVZK2dpZFc3bDl2Vm1Ud3ZKQXVyUkVyRFVHQTVuK2Y5Y2h1Wkgz?=
 =?utf-8?B?dVkwZWRCRi9pbTFIV2RweUY5cGxRNUE4MkViM251b29BL1JEYU8rMTd1VTN3?=
 =?utf-8?B?TnNua3BtMUhYdGdlS1RreFgxekhtdzFJUG81SmdTdmRESlM2a2JyVUVSYTUz?=
 =?utf-8?B?MW4vRHZNV3N2WDE2TDR0NDhLTVVkVTFqMTc5RVZwZHZTM2d1WWVhbXQzTzJZ?=
 =?utf-8?B?ajZlaGxTVXlZNHRtb0NTZlZmS2JFRnloZkppQXVEZjFEV05yYWpEc2pLRHp5?=
 =?utf-8?B?anI2N1owVFZMNmNtY1JSVlV4b2dkZ1pqS0lFV3kwbWZvanhyR09UUlpIZFNT?=
 =?utf-8?B?U1lNVmdRNUpucFo0NXlzSmRIa3BjUVpwcXEyNkNOaExTa2xLT1dscnBWTTZF?=
 =?utf-8?B?RHdmNmp3MmZkaUx3UE1XWC9VRVdINmtlcW0wM0VDYmNjZVlmeDlxRHQ5SmMv?=
 =?utf-8?B?djVKSmhJemw1T0UrQ3pPbUtlZXBMZlpJTCtYb1ovZnJEbkFkUS9vcDdJcU1P?=
 =?utf-8?B?em5LUVpVZ0FjUExrQUxvc2xxWUszY3pyOHpvK2xmdmRTaFRlREdxZ2N5SGx3?=
 =?utf-8?B?TGpFTkJHZFJjYWdlWXoxT1hSL09IbVB3N08zU1Q0WVFCOHhoQUx4UVc0cXA2?=
 =?utf-8?B?TG9qQ0w2b2lmenoweVdYQUlneCtQRVdpTUJDWHNCSDlpc0NMd1R0UDNJeHE1?=
 =?utf-8?B?RTZFS0dSWHpURVVmYStBMjQreU1mVlpzUkRWZ1JpSytHdDdpd1JLazdWdk9K?=
 =?utf-8?Q?e738=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 299712a8-ac1a-403e-0ea7-08dde1226afc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 02:20:09.9976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEEHrL9+M7qcWOCRIJVoKP6jHh4vWue+/+YKNuS646xwwJ45luqi1s0UaoCCMDY8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8154

Many thanks Sakari Ailus for your deep insight

On 8/20/2025 8:42 PM, Sakari Ailus wrote:
> Hi Bin,
> 
> On Tue, Aug 12, 2025 at 09:36:04AM +0800, Du, Bin wrote:
>> Many thanks Laurent Pinchart for the review.
>>
>> On 8/5/2025 7:37 PM, Laurent Pinchart wrote:
>>> On Wed, Jun 18, 2025 at 05:19:59PM +0800, Bin Du wrote:
>>>> Add documentation for AMD isp 4 and describe the main components
>>>>
>>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>>> ---
>>>>    Documentation/admin-guide/media/amdisp4-1.rst | 64 +++++++++++++++++++
>>>>    Documentation/admin-guide/media/amdisp4.dot   |  8 +++
>>>>    MAINTAINERS                                   |  2 +
>>>>    3 files changed, 74 insertions(+)
>>>>    create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>>>    create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>>>
>>>> diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
>>>> new file mode 100644
>>>> index 000000000000..417b15af689a
>>>> --- /dev/null
>>>> +++ b/Documentation/admin-guide/media/amdisp4-1.rst
>>>> @@ -0,0 +1,64 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +.. include:: <isonum.txt>
>>>> +
>>>> +====================================
>>>> +AMD Image Signal Processor (amdisp4)
>>>> +====================================
>>>> +
>>>> +Introduction
>>>> +============
>>>> +
>>>> +This file documents the driver for the AMD ISP4 that is part of
>>>> +AMD Ryzen AI Max 385 SoC.
>>>> +
>>>> +The driver is located under drivers/media/platform/amd/isp4 and uses
>>>> +the Media-Controller API.
>>>> +
>>>> +Topology
>>>> +========
>>>> +
>>>> +.. _amdisp4_topology_graph:
>>>> +
>>>> +.. kernel-figure:: amdisp4.dot
>>>> +     :alt:   Diagram of the media pipeline topology
>>>> +     :align: center
>>>> +
>>>> +
>>>> +
>>>> +The driver has 1 sub-device:
>>>> +
>>>> +- isp: used to resize and process bayer raw frames in to yuv.
>>>> +
>>>> +The driver has 1 video device:
>>>> +
>>>> +- <capture video device: capture device for retrieving images.
>>>> +
>>>> +
>>>> +  - ISP4 Image Signal Processing Subdevice Node
>>>> +-----------------------------------------------
>>>> +
>>>> +The isp4 is represented as a single V4L2 subdev, the sub-device does not
>>>> +provide interface to the user space.
>>>
>>> Doesn't it ? The driver sets the V4L2_SUBDEV_FL_HAS_DEVNODE flag for the
>>> subdev, and calls v4l2_device_register_subdev_nodes().
>>>
>>
>> We have exported subdev device to user space during the testing with
>> libcamera sample pipeline.
>>
>>> As far as I understand, the camera is exposed by the firmware with a
>>> webcam-like interface. We need to better understand your plans with this
>>> driver. If everything is handled by the firmware, why are the sensor and
>>> subdev exposed to userspace ? Why can't you expose a single video
>>> capture device, with a media device, and handle everything behind the
>>> scene ? I assume there may be more features coming later. Please
>>> document the plan, we can't provide feedback on the architecture
>>> otherwise.
>>>
>>
>> Currently, isp fw is controlling the sensor to update just the exposure and
>> gain, since the 3A algorithms run on ISP HW rather than on x86. In a future
>> version, we plan to introduce raw output support in the ISP driver, allowing
>> users to choose between AMD’s 3A running on ISP hardware or a custom 3A
>> running on x86. If the user opts for the x86-based 3A, the firmware will
>> relinquish control of the sensor, and hands over full control to the x86
>> system.
> 
> There are a few problems I see with this approach.
> 
> Camera sensors are separate devices from the ISP and they're expected to be
> controlled by the respective camera sensor drivers and these drivers only.
> The firmware contains the camera control algorithms as well as tuning; this
> is something that's better located outside of it.
> 
> The complex camera system comprising of a camera sensor, an ISP and a
> microcontroller within you have is right now semi-integrated to the SoC and
> I think it needs to be either fully unintegrated (the ISPs we currently
> support) or fully integrated (e.g. UVC webcams).
> 
> There are two options that I can see here, in descending order of
> preference:
> 
> 1. Control the ISP processing blocks from the AMD ISP driver, via a
>     documented UAPI. This includes setting processing block parameters and
>     being able to obtain statistics from the ISP. This is aligned with the
>     other currently supported ISP drivers.
>     
>     This option could include support for the CSI-2 receiver only, with the
>     processing taking place in SoftISP. Fully supported ISP would of course
>     be preferred.
>     
>     Right now I don't have an opinion on whether or not this needs to
>     include libcamera support, but the ISP driver wouldn't be of much use
>     without that anyway.
> 
> 2. Move sensor control to firmware and make the AMD ISP driver expose an
>     interface that looks like a webcam, akin to the UVC driver. In this case
>     there's also no use for the sensor driver you've posted earlier.
>     Overall, the ISP/sensor combination will probably be limited to use as a
>     webcam in this case.
> 

Based on our internal discussion and validation, will make option 2 as 
our current upstream target, after that, will plan option 1 with more 
considerations, a. Whether to provide the capability and interface so 
user can do switch between option 1 and 2. b. Whether and how to expose 
interface so host can leverage the ISP HW feature to accelerat some 
processing. Though sensor driver is not used in option 2, we still plan 
to upstream it because of option 1 as next step.

-- 
Regards,
Bin


